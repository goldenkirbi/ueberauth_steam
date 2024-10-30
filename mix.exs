defmodule UeberauthSteam.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_steam,
      description: "Steam OpenID Strategy for Überauth.",
      version: "0.1.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),

      # Testing
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"],

      # Docs
      name: "Überauth Steam",
      source_url: "https://github.com/shinyscorpion/ueberauth_steam",
      homepage_url: "https://github.com/shinyscorpion/ueberauth_steam",
      docs: [
        main: "readme",
        extras: ["README.md"],
      ],
    ]
  end

  def package do
    [
      name: :ueberauth_steam,
      maintainers: ["Ian Luites"],
      licenses: ["MIT"],
      files: [
        "lib/ueberauth", "lib/ueberauth_steam.ex", "mix.exs", "README*", "LICENSE*", # Elixir
      ],
      links: %{
        "GitHub" => "https://github.com/shinyscorpion/ueberauth_steam",
      },
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      # Dependencies
      {:req, "~> 0.4"},
      {:ueberauth, "~> 0.4"},
      {:oauth2, "~> 1.0 or ~> 2.0"},

      # Testing
      {:meck, "~> 0.9", only: :test},

      # Code Maintenance
      {:credo, "~> 1.7", only: [:dev, :test]},
      {:dialyxir, "~> 1.4", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.15", only: :dev},
      {:excoveralls, "~> 0.6", only: :test},
      {:inch_ex, "~> 2.0", only: [:dev, :test]},
    ]
  end
end
