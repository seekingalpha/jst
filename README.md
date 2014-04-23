# JST

JST is a simple javascript templating system inspired by Sprockets' homonimous templating system, but built on top of PrototypeJS's template system and for rails projects without Sprockets.

## Install

Add this line to your application's Gemfile:

    gem 'jst', github: "seekingalpha/jst"

And then execute:

    $ bundle

## Usage

Create a folder in your project and add PrototypeJS templates with the ".jst" extension. Let's suppose you have a "hi.jst" file in "app/assets/javascripts/templates":

```html
  <h1>Hi, #{name}</h1>
```

In order to compile your templates, run:

```ruby
  JST::Aggregator.new("app/assets/javascripts/templates").save("public/javascripts/templates.js")
```

Now you can use the templates like this in your JS files:

```js
  Templates.hi({name: "Emmanuel"})
```

This will output ```<h1>Hi, Emmanuel</h1>```, as expected. Notice the method "hi" is created automatically based on the name of the template file.

Enjoy!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
