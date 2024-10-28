defmodule CustomerSegmentation.Repo do
  use Ecto.Repo,
    otp_app: :customer_segmentation,
    adapter: Ecto.Adapters.Postgres
end
