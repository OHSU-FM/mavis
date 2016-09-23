require "sinatra/config_file"
require "./mavis/client"

class Mavis < Sinatra::Base
  register Sinatra::ConfigFile
  config_file "./config/settings.yml"

  get "/" do
    Mavis::Client.test()
  end
end
