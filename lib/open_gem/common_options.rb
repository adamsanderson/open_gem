module OpenGem
  module CommonOptions
    def add_command_option(description=nil)
      add_option('-c', '--command COMMAND',
                 description || 'Execute command at path of the rubygem') do |value, options|
        options[:command] = value
      end
    end

    def add_latest_version_option
      add_option('-l', '--latest',
                 'If there are multiple versions, open the latest') do |value, options|
        options[:latest] = true
      end
    end
    
  end
end