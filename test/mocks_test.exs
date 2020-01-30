defmodule MocksTest do
  use ExUnit.Case
  doctest Mocks

  test "convert_currency when valid" do
    expected = Decimal.new("202.6")
    assert {:ok, ^expected} = Mocks.convert_currency("2", %{from: "USD", to: "KES"})
  end

  test "convert_currency when invalid" do
    assert {:error, _} = Mocks.convert_currency("2", %{from: "KES", to: "KES"})
  end
end
