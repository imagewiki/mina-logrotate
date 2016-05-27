# Mina Logrotate

Inspired on [mina-nginx](https://github.com/hbin/mina-nginx) gem, provides [Mina](https://github.com/nadarei/mina) tasks to work with [Logrotate](http://www.linuxcommand.org/man_pages/logrotate8.html)

This gem provides several mina tasks (you can check using `mina tasks`):

```
mina logrotate:apply             # Run logrotate into symlink file
mina logrotate:link              # Symlinking logrotate config file
mina logrotate:parse             # Parse logrotate configuration file and upload it to the server
mina logrotate:setup             # Setup logrotate
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-logrotate', require: false
```
And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install mina-logrotate
```

## Usage

Add this to your `config/deploy.rb` file:
```ruby
require 'mina/logrotate'
```
Make sure the following settings are set in your `config/deploy.rb`:

* `application` - application name
* `deploy_to`   - deployment path

Launch new tasks:

```
$ mina logrotate:setup
$ mina logrotate:link
```

There is a default [template file](lib/mina/templates/logrotate.erb) to use logrotate with all files inside shared/log but it's allowed define the template file with

```ruby
private

def logrotate_template
  '/path/to/my/template/file'
end
```

## Contributing

1. Fork it ( http://github.com/hbin/mina-logrotate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

