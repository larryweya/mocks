defmodule Mocks.MixProject do
  use Mix.Project

  def project do
    [
      app: :mocks,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:decimal, "~> 1.0"},
      {:mox, "~> 0.5", only: :test}
    ]
  end
end
