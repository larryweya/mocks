defmodule Mocks.HTTPExchangeRateService do
  @behaviour Mocks.ExchangeRateService

  @impl Mocks.ExchangeRateService
  def get_rate(%{from: from, to: to}, config) do
    url = Keyword.fetch!(config, :url) <> "?from=#{from}&to=#{to}"

    with {:ok, %{status_code: 200, body: body}} <- HTTPoison.get(url),
         {:ok, data} <- Poison.decode(body) do
      case data do
        %{"status" => "ok", "rate" => rate} ->
          {:ok, rate}

        %{"status" => "error", "message" => message} ->
          {:error, message}
      end
    else
      _ ->
        {:error, :failed}
    end
  end
end
