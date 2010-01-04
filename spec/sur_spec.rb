require 'stringio'
$: << File.expand_path(__FILE__) + '/../lib'
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
    pending
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
end
