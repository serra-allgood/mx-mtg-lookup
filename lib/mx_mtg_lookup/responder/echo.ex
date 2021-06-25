defmodule MxMtgLookup.Responder.Echo do
  use Igor.Responder.ModuleHelper

  listen ~r/.*/, matches, msg, bot do
    matches |> Igor.send(msg, bot)
  end
end
