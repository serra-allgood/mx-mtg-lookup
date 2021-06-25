defmodule Mix.Tasks.Igor.Run do
  @moduledoc """
  Runs Igor as a standalone bot.

  Igor should first be configured using a `config/config.exs` file, under a
  `config :igor, ...` statement.  See Igor's `README.md` or
  `config/config_sample.exs` files for more information.

  """
  @shortdoc "Runs Igor as a standalone bot"
  use Mix.Task

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start", args)
    {:ok, pid} = Igor.start_link(Application.get_all_env(:igor))
    ref = Process.monitor(pid)

    receive do
      {:DOWN, ^ref, :process, _object, reason} -> reason
    end
  end
end
