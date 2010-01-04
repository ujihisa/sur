# Sur: Software Update for Rubygems

Sur provides the self-updating system for arbitrary end-user softwares hosted as Gem packages.

    $ termtter
    The new version of termtter is available. Do you update now? [Y/n] y
    updating termtter.....done.

## Usage

    require 'sur'
    Sur.ask

Advanced usage:

    Sur.ask_as 'termtter'
    Sur.ask :without_reboot

Usually `Sur.ask` is ignored when the software isn't running as a gem,
but `:always` option can force asking.

    Sur.ask :always

## Author

Tatsuhiro Ujihisa <http://ujihisa.blogspot.com/>
