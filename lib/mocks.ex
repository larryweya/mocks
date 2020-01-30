defmodule Mocks do
  @moduledoc """
  Documentation for Mocks.
  """

  def convert_currency(amount, params) do
    case Mocks.ExchangeRateService.get_exchange_rate(params) do
      {:ok, rate} ->
        # convert the amount
        {:ok, Decimal.mult(amount, rate)}

      {:error, _} = error ->
        # return error as is
        error
    end
  end
end
