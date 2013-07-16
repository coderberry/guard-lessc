# Guard::Lessc

Automatically compiles a less file to a target output file using the lessc command.

## Installation

This guard is dependant on lessc so install that first:

```
$ npm install -g less
```

Add this line to your application's Gemfile:

``` ruby
group :development do
  gem 'guard-lessc'
end
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install guard-lessc
```

Add a default configuration to your guardfile:

```
$ guard init lessc
```

## Usage

See the [guard usage documentation](https://github.com/guard/guard#readme) for
more guard usage information.

## Guardfile

This sample guard will run ember build for any change in the javascripts directory,
excluding the three files that `ember build` uses to compile the application.
``` ruby
guard :lessc, :in_file => 'less/main.less', :out_file => 'public/stylesheets/application.css', :compress => true do
  watch(%r{^.*\.less$})
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request