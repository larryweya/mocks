import Config

config :mocks, Mocks.ExchangeRateService,
  module: Mocks.HTTPExchangeRateService,
  url: "http://localhost:4011/api/currency-converter"
