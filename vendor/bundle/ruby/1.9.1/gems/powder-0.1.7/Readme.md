powder manages [pow](http://pow.cx/)

# Install #

    gem install powder

# Usage #


### Linking apps in Pow ###

    powder will attempt to read .powder, which names a default symlink for the current project

    $ powder [-h|help]
    => Display usage information
    # Lists name and brief descriptions of the tasks available

    $ powder link
    => Link the current dir to ~/.pow/<current_directory>

    $ powder link [bacon]
    => Link the current dir to ~/.pow/bacon
    => Create .powder, contents bacon

    $ powder link [bacon] --no-create
    => Link the current dir to ~/.pow/bacon

    $ powder link [bacon] --force
    => Remove the current pow symlink, and .powder
    => Link the current dir to ~/.pow/bacon
    => Create .powder, contents bacon

    # For both forms of link, if the current directory doesn't
    # look like an app that can be powed it will offer to download
    # a basic config.ru for Rails 2

    $ powder unlink
    => Unlink current_dir or the symlink defined in .powder

    $ powder unlink bacon
    => Unlink bacon

    $ powder cleanup
    => remove all invalid symbolic links

### Working with Pow ###

    $ powder applog
    => tail the log of the current app

    $ powder config
    => Get Pow's current configuration information

    $ powder list
    => List all the current apps linked in ~/.pow
    # aliased as powder -l

    $ powder log
    => Tails the pow log.
    # Not the application log, but the pow log, available at
    # ~/Library/Logs/Pow/apps/#{app-directory}.log

    $ powder open
    => Opens the pow link in a browser
    # aliased as powder -o

    $ powder open [bacon]
    => Opens http://bacon.dev in a browser
    # if you have set up alternative top level domains in .powconfig,
    # then the first listed domain will be opened.

    $ powder restart
    => Restart the current app
    # aliased as powder -r

    $ powder always_restart
    => Always restart the current app
    # aliased as powder -a

    $ powder no_restarts
    =>  don't do any automatic restarting of the current app

    $ powder status
    => Get Pow's current status information

    $ powder version
    => Returns the current powder version
    # aliased as powder -v

### Install and uninstall Pow ###

    $ powder install
    => Installs pow server
    # (I know, "curl get.pow.cx | sh" isn't hard, but this is _even_ easier)

    $ powder uninstall
    => Uninstalls pow server

    $ powder update
    => Updates pow server
    # Really this is just an alias to powder install, but it feels more natural
    # this way.

### Enable and Disable Pow ###

    $ powder up
    => Enable Pow

    $ powder down
    => Disable Pow

# Contributors #

Built by [rodreegez](https://github.com/Rodreegez) and [philnash](https://github.com/philnash).

Massive thanks to all our great
[contributors](https://github.com/Rodreegez/powder/contributors)

## Copyright ##

Copyright (c) 2011 Adam Rogers and Phil Nash. See LICENSE for details.

Lovingly supported by [Mint Digital](http://mintdigital.com)
