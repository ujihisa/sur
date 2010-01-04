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
    Sur.ask 'termtter', :without_reboot

## Author

Tatsuhiro Ujihisa <http://ujihisa.blogspot.com/>
