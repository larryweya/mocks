defmodule Mocks.ExchangeRateService do
  @callback get_rate(Map.t(), Keyword.t()) ::
              {:ok, Decimal.t()} | {:error, String.t()} | {:error, :failed}

  def get_exchange_rate(params) do
    config = Application.fetch_env!(:mocks, __MODULE__)
    Keyword.fetch!(config, :module).get_rate(params, config)
  end
end
