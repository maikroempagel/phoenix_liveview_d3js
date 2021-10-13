defmodule D3Demo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      D3DemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: D3Demo.PubSub},
      # Start the Endpoint (http/https)
      D3DemoWeb.Endpoint
      # Start a worker by calling: D3Demo.Worker.start_link(arg)
      # {D3Demo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: D3Demo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    D3DemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
