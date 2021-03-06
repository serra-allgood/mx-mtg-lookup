defmodule MxMtgLookup.MixProject do
  use Mix.Project

  def project do
    [
      app: :mx_mtg_lookup,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MxMtgLookup.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:igor, "~> 0.2.1"},
      {:finch, "~> 0.8.0"},
      {:jason, "~> 1.2"},
      {:polyjuice_client, git: "https://gitlab.com/serra-allgood/polyjuice_client.git", branch: "master", override: true},
    ]
  end
end
