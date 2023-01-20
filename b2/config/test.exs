import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :b2, B2Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "UQbu4MHcbV/dNGynaFHlsYY9hUe6VV/Mo5iud5d5Zf7VQlxZyhUAKoGPZbWw0GYF",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
