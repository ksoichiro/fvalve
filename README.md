# Fvalve

Simple file rotation script.  
fvalve keeps a certain number of files in a directory like a valve.

## Installation

Add this line to your application's Gemfile:

    $ gem 'fvalve'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fvalve

## Usage

Leaves 3 files with pattern `*.log` in `target` dir:

    $ fvalve target "*.log" 3

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fvalve/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Other Installation Example

Here's an example of installing `fvalve` in CentOS 6.5(Vagrant).

    $ curl -sSL https://get.rvm.io | bash -s stable
    $ source ~/.profile
    $ rvm requirements
    $ rvm install 1.9.3
    $ echo 'source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    $ source ~/.bashrc
    $ rvm use 1.9.3
    $ gem install fvalve
