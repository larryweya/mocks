import Config

config :mocks, Mocks.ExchangeRateService,
  module: Mocks.HTTPExchangeRateService,
  url: "http://localhost:4011/api/currency-converter"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
