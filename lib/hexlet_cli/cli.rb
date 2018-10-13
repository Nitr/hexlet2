require 'thor'

module HexletCli
  class CLI < Thor
    desc 'convert', 'convert currency from => to'
    option :from
    option :to
    def convert(amount)
      puts HexletCli.convert(amount, options.transform_keys(&:to_sym))
    end

    default_task :convert
  end
end
