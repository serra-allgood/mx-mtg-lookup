defmodule MxMtgLookup.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Igor, Application.get_all_env(:igor)}
    ]
    opts = [strategy: :one_for_one, name: MxMtgLookup.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
