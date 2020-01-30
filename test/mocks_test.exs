defmodule MocksTest do
  use ExUnit.Case
  doctest Mocks

  import Mox

  # Make sure mocks are verified when the test exits setup :verify_on_exit!
  setup :verify_on_exit!

  test "convert_currency when valid" do
    Mocks.MockExchangeRateService
    |> expect(:get_rate, fn %{from: "USD", to: "KES"}, _ ->
      {:ok, Decimal.new("101.3")}
    end)

    expected = Decimal.new("202.6")
    assert {:ok, ^expected} = Mocks.convert_currency("2", %{from: "USD", to: "KES"})
  end

  test "convert_currency when invalid" do
    Mocks.MockExchangeRateService
    |> expect(:get_rate, fn %{from: "KES", to: "KES"}, _ ->
      {:error, "Cannot convert to the same currency"}
    end)

    assert {:error, "Cannot convert to the same currency"} =
             Mocks.convert_currency("2", %{from: "KES", to: "KES"})
  end
end
