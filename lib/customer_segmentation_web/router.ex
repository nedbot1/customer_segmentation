defmodule CustomerSegmentationWeb.Router do
  use CustomerSegmentationWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CustomerSegmentationWeb do
    pipe_through :api

    resources "/professions", ProfessionController, except: [:new, :edit]

    resources "/dzongkhags", DzongkhagController, except: [:new, :edit]

    resources "/income_levels", IncomeLevelController, except: [:new, :edit]

    resources "/survey_questions", SurveyQuestionController, except: [:new, :edit]

    resources "/respondents", RespondentController, except: [:new, :edit]

    resources "/survey_responses", SurveyResponseController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:customer_segmentation, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: CustomerSegmentationWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
