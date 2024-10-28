defmodule CustomerSegmentation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CustomerSegmentationWeb.Telemetry,
      CustomerSegmentation.Repo,
      {DNSCluster, query: Application.get_env(:customer_segmentation, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CustomerSegmentation.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CustomerSegmentation.Finch},
      # Start a worker by calling: CustomerSegmentation.Worker.start_link(arg)
      # {CustomerSegmentation.Worker, arg},
      # Start to serve requests, typically the last entry
      CustomerSegmentationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CustomerSegmentation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CustomerSegmentationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
