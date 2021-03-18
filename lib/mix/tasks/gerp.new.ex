defmodule Mix.Tasks.Gerp.New do
  @moduledoc """
  Creates a new 🌟 GraphQL + Elixir + React + Postgres 🌟 project

  Expects the path of the project as an argument.
      
      mix gerp.new PATH

  A project at the given PATH will be created.
  """

  use Mix.Task

  @version Mix.Project.config()[:version]

  @switches [dev: :boolean]

  @impl true
  def run([version]) when version in ~w(-v --version) do
    Mix.shell().info("gerp v#{@version}")
  end

  def run(argv) do
    dependencies_check!()

    case parse_opts(argv) do
      {_opts, []} ->
        Mix.Tasks.Help.run(["gerp.new"])

      {opts, [base_path | _]} ->
        generate(base_path, opts)
    end
  end

  defp generate(base_path, _opts) do
  end

  defp parse_opts(argv) do
    case OptionParser.parse(argv, strict: @switches) do
      {opts, argv, []} ->
        {opts, argv}

      {_opts, _argv, [switch | _]} ->
        Mix.raise("Invalid option: " <> switch_to_string(switch))
    end
  end

  defp switch_to_string({name, nil}), do: name
  defp switch_to_string({name, val}), do: name <> "=" <> val

  defp dependencies_check!() do
    if System.find_executable("npm") == nil do
      Mix.raise("Gerp requires npm to be installed")
    end

    if System.find_executable("npx") == nil do
      Mix.raise("Gerp requires npx to be installed")
    end
  end
end
