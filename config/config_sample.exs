# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

config :igor,
  # the base URL for the homeserver
  homeserver_url: "http://localhost:8008/",

  # the access token to use on the Matrix server.  WARNING: do not commit a
  # real value for this to a publicly accessible repository.
  # Note: rather than specifying an access token in here, it's recommended to
  # use:
  #   `mix polyjuice.login --storage='Igor.Storage.dets(".")' <hsurl> <username> <password>`
  # to log in and store the access token in the storage.  (Replace
  # `Igor.Storage.dets(".")` with the storage that you use below.)
  access_token: "some_access_token",

  # the device ID for the bot's session (optional)
  device_id: "ZPGHBLBEPS",

  # the primary name for the bot
  bot_name: "igor",
  # the Matrix ID of the bot
  mxid: "@igor:example.com",
  # a list of other names that the bot should respond to
  aka: [],
  # prefixes that can be used to trigger commands (other than the bot's names)
  command_prefixes: ["!"],
  # a list of responders to use
  responders: [
    # a module that uses the Igor.Responder callbacks
    Igor.Responder.Ping,
    # a {module, function_name, arguments} that will create something that
    # follows the Igor.Responder.Proto protocol
    {Igor.Responder.Uptime, :create, []}
    # items can also be {function_ref, arguments} that will create a responder
  ],
  # where to store data.  Igor.Storage.dets will create an Erlang dets store.
  # The parameter is the directory where the file(s) will be stored.
  storage: {Igor.Storage, :dets, ["."]}

#
# and access this configuration in your application as:
#
#     Application.get_env(:igor, :key)
#
config :logger,
  level: :debug

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
