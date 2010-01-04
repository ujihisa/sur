module Sur
  module_function

  def ask(*options)
    # TODO: Handle options
    # TODO: Abondon at_exit
    print "The new version of termtter is available. Do you update now? [Y/n] "
    STDOUT.flush
    process if /^y$/i =~ gets
  end

  class << self
    private

    def process
      # TODO: Is it true that the command is `gem`? it's also possible that
      #   that is `gem192`.
      if sudo_is_needed
        exec 'sudo', 'gem', 'update', the_name
      else
        exec 'gem', 'update', the_name
      end
    end

    def sudo_is_needed
      # TODO: Implement it
      true
    end

    def the_name
      # TODO: It's dummy
      File.basename($0).sub(/\.rb$/, '')
    end
  end
end
