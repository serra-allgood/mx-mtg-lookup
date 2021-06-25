defmodule MxMtgLookup do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(state), do: {:ok, state}
end
