require 'spec_helper'

describe JST::Aggregator do

  subject(:js){ V8::Context.new }

  let(:code){ JST::Aggregator.new }

  let(:prototype){ File.read("spec/fixtures/mock_prototype.js") }
  let(:handlebars){ File.read("spec/fixtures/mock_handlebars.js") }

  before do
    JST.configure do |config|
      config.templates_path = "spec/fixtures"
      config.output = "/tmp/#{Time.now}.js"
    end

    js.eval(prototype)
    js.eval(handlebars)
    js.eval(code)
  end

  it "should have a hash named Templates with a hello method using prototype" do
    expect( js.eval('Templates.hello({name: "John"})') ).to eq "OK"
  end

  it "should have a hash named Templates with a hi method using prototype" do
    expect( js.eval('Templates.hi({name: "John"})') ).to eq "OK"
  end

  it "should have a hash named Templates with a hi method using handlebars" do
    expect( js.eval('Templates.hellohb({name: "John"})') ).to eq "<h1>Hello, <a href=\"#foo\">John</a></h1>\n"
  end
end
