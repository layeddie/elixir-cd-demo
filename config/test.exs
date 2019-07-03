use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :deploy_demo, DemoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :deploy_demo, Demo.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

if url = System.get_env("DATABASE_URL") do
  config :deploy_demo, Demo.Repo, url: url
else
  config :deploy_demo, Demo.Repo,
    username: "postgres",
    password: "postgres",
    database: "deploy_demo_test",
    hostname: "localhost"
end
