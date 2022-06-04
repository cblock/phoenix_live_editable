defmodule PleDemoBaseWeb.Router do
  use PleDemoBaseWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PleDemoBaseWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PleDemoBaseWeb do
    pipe_through :browser

    live "/", PageLive
    live "/test1", Test1Live
    live "/test2", Test2Live
  end
end
