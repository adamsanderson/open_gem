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
    
    def get_spec(name)
      dep = Gem::Dependency.new(name, options[:version])
      specs = Gem::Specification.find_all_by_name(name,options[:version])
      if block_given?
        specs = specs.select{|spec| yield spec}
      end

      if specs.length == 0
        say "#{name.inspect} is not available"
        return nil

      elsif specs.length == 1 || options[:latest]
        return specs.last

      else
        choices = specs.map{|s|"#{s.name} #{s.version}"}
        c,i = choose_from_list "Open which gem?", choices
        return specs[i] if i

      end
    end
  end
end