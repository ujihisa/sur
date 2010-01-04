require 'stringio'
require 'tempfile'
$: << File.dirname(File.expand_path(__FILE__)) + '/../lib'
require 'sur'

describe 'Sur.ask' do
  it 'makes sure that you want to update the software. Always' do
    $stdout, $stdin = StringIO.new, StringIO.new.puts('n')
    Sur.ask
    stdout, $stdout, $stdin = $stdout, STDOUT, STDIN
    stdout.rewind

    stdout.read.should == 'The new version of termtter is available. Do you update now? [Y/n] '
  end
end

describe 'Sur.process' do
  it 'is private' do
    lambda { Sur.process }.should raise_error(NoMethodError)
  end

  it 'updates the application' do
    exec_log = []
    Kernel.method(:define_method).call(:exec) {|*o| exec_log << o }
    Sur.send(:process)
    exec_log.should == [['gem', 'update', 'spec']]
  end
end


describe 'Sur.sudo_is_needed' do
  it 'is private' do
    lambda { Sur.sudo_is_needed }.should raise_error(NoMethodError)
  end

  it 'is true when the gem executable file is running under the global area' do
    # This spec assumes you've already installed `dummygem` under your home directory.
    pending
  end

  it 'is false when the gem executable file is running under the user area' do
    # This spec assumes you've already installed `dummygem` under your home directory.
    `dummygem`.strip.should == 'false'
  end
end
describe 'Sur.the_name' do
  it 'is private' do
    lambda { Sur.the_name }.should raise_error(NoMethodError)
  end

  it 'returns the application which has required Sur' do
    # In this case, the application is of course RSpec
    Sur.send(:the_name).should match(/spec/)
  end

  it '...really?' do
    t = File.dirname(Tempfile.new('a').path) + '/termtter.rb'
    File.open(t, 'w') {|io| io.puts <<-"E" }
    require '#{File.dirname(File.expand_path(__FILE__)) + '/../lib/sur'}'
    puts Sur.send(:the_name)
    E
    `ruby #{t}`.should == "termtter\n"
  end
end
