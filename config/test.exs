import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_liveview_d3js, D3DemoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Wga2t6fnPr6BPuZc6yvaSy/N6c8g50vdNWdNeRdWzucIoO17NNwV83qdSIUxrAY2",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
