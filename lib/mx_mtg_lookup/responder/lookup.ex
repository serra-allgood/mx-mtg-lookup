defmodule MxMtgLookup.Responder.Lookup do
  use Igor.Responder.ModuleHelper

  listen ~r/\[\[([\w\s,:]+)\]\]/, matches, msg, bot do
    matches
    |> IO.inspect()
    |> Enum.each(fn [_, match] ->
      with {:ok, resp} <- Scry.named(match),
           {:ok, mxc_uri} <- Polyjuice.Client.Media.upload(bot.client, resp.body, [filename: "#{match}.jpg", mimetype: "image/jpg"]) do
        Polyjuice.Client.MsgBuilder.image(mxc_uri)
        |> Polyjuice.Client.MsgBuilder.to_message("m.image")
        |> Igor.send(msg, bot)
           else
            {:error, details} when is_binary(details) ->
              Igor.send("Error looking up #{match}: #{details}", msg, bot)
            _ ->
              Igor.send("Error looking up #{match}", msg, bot)
            end
    end)
  end
end
