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
