require 'thor'

module HexletCli
  class CLI < Thor
    desc "ping", "just for test"
    def ping
      puts 'pong'
    end

    default_task :ping
  end
end
