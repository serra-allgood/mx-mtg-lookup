defmodule Scry do
  require Logger
  @base_url "https://api.scryfall.com"

  def named(name) do
    encoded_query = URI.encode_query(%{"fuzzy" => name})
    Finch.build(:get, "#{@base_url}/cards/named?#{encoded_query}")
    |> Finch.request(ScryFinch)
    |> extract_image
  end

  defp extract_image(resp) do
    case resp do
      {:ok, resp} ->
        body = resp.body
        |> Jason.decode!

        case Map.fetch(body, "image_uris") do
          {:ok, uris} ->
            uri = Map.fetch!(uris, "normal")
            Finch.build(:get, uri)
            |> Finch.request(ScryFinch)
          :error ->
            {:error, Map.fetch!(body, "details")}
        end
      {:error, exception} ->
        {:error, exception}
    end
  end
end
