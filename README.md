[![Code Climate](https://codeclimate.com/repos/5358f2f0e30ba06766001f0b/badges/4b55d6afc21edbf37bc0/gpa.png)](https://codeclimate.com/repos/5358f2f0e30ba06766001f0b/feed)

[![Build Status](https://travis-ci.org/seekingalpha/jst.svg?branch=master)](https://travis-ci.org/seekingalpha/jst)


# JST

JST is a simple javascript templating system inspired by Sprockets' homonimous templating system, but built for rails projects without Sprockets.

JST works on top of [PrototypeJS's template system](http://prototypejs.org/doc/latest/language/Template/) and [HandleBars](http://handlebarsjs.com/).

## Install

Add this line to your application's Gemfile:

    gem 'jst', github: 'seekingalpha/jst'

And then execute:

    $ bundle

## Usage

Create a folder in your project and add PrototypeJS templates with the ".jst.pt" extension or Handlebars with the ".jst.hb". Let's suppose you have a "hi.jst.pt" file in "app/assets/javascripts/templates":

```html
  <h1>Hi, #{name}</h1>
```
In order to compile your templates, run:

```ruby
  JST::Aggregator.new('app/assets/javascripts/templates').save('public/javascripts/templates.js')
```

If you don't wanna pass the paths every time, you can configure it first (rule of thumb: add it to config/initializers/jst.rb):

```ruby
  JST.configure do |config|
    config.templates_path = 'app/assets/javascripts/templates'
    config.output         = 'public/javascripts/templates.js'
  end
```

Then you can just run:

```ruby
  JST.process!
```

Now, load templates.js in your view and then you can use the templates like this in your JS files:

```js
  Templates.hi({name: 'Emmanuel'})
```

This will output ```<h1>Hi, Emmanuel</h1>```, as expected. Notice the method "hi" is created automatically based on the name of the template file.

Enjoy!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Roadmap

- Use guard to watch template folder and compile automatically when changed.
- ~~Allow handlebars templates.~~
