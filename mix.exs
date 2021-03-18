defmodule Gerp.New.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :gerp_new,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      archives: [{:phx_new, "~> 1.5"}],
      deps: deps(),
      package: [
        maintainers: [
          "Kramer Hampton"
        ],
        licenses: ["MIT"],
        files: ~w(lib templates mix.exs README.md)
      ],
      description: """
      GERP Stack project generator.

      Provides a `mix gerp.new` task to bootstrap a new Phoenix and React
      project that communicates via GraphQL using Absinthe.
      """
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
