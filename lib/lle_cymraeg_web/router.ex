defmodule LleCymraegWeb.Router do
  use LleCymraegWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_authed do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureResource, handler: LleCymraegWeb.AuthErrorHandler
  end

  scope "/", LleCymraegWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/v1", LleCymraegWeb do
    pipe_through :api

    post "/register", AuthController, :register
    post "/login", AuthController, :login
    get "/logout", AuthController, :logout
  end

  scope "/v1", LleCymraegWeb do
    pipe_through :api_authed

    resources "/accounts", AccountController, except: [:new, :edit]
    resources "/businesses", BusinessController, except: [:new, :edit]
    resources "/business-types", BusinessTypeController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/invitations", InvitationController, except: [:new, :edit]
    resources "/languages", LanguageController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/meetups", MeetupController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
    resources "/people", PersonController, except: [:new, :edit]
  end
end
