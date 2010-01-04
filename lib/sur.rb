module Sur
  module_function

  def ask(*options)
    # TODO: Handle options
    # TODO: Abondon at_exit
    print "The new version of termtter is available. Do you update now? [Y/n] "
    STDOUT.flush
    process if /^y$/i =~ gets
  end

  def process
    # TODO: Implement it
  end
end
