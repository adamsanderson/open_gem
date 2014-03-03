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

    def add_exact_match_option
      add_option('-x', '--exact',
                 'Only list exact matches') do |value, options|
        options[:exact] = true
      end
    end

    def get_spec(name)
      version = options[:version] || Gem::Version.new(">= 0")
      exact   = options[:exact]
      
      specs = Gem::Specification.find_all do |s|
        if name.is_a? String
          name_match = s.name == name
        else
          name_match = s.name[name]
        end
        
        name_match && version.satisfied_by?(s.version)
      end

      if block_given?
        specs = specs.select{|spec| yield spec}
      end

      if specs.length == 0
        # If we have not tried to do a pattern match yet, fall back on it.
        if(!exact && !name.is_a?(Regexp))
          pattern = /#{Regexp.escape name}/
          get_spec(pattern)
        else
          say "#{name.inspect} is not available"
          return nil
        end

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
