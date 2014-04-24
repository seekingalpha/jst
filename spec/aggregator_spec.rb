require 'spec_helper'
require 'open-uri'

describe JST::Aggregator do

  subject(:js){ V8::Context.new }

  let(:prototype){ File.read("spec/fixtures/mock_prototype.js") }
  let(:code){ JST::Aggregator.new }

  before do
    JST.configure do |config|
      config.templates_path = "spec/fixtures"
      config.output = "/tmp/#{Time.now}.js"
    end

    js.eval(prototype)
    js.eval(code)
  end

  it "should have a hash named Templates with a hello method" do
    expect( js.eval('Templates.hello({name: "John"})') ).to eq "OK"
  end

  it "should have a hash named Templates with a hi method" do
    expect( js.eval('Templates.hi({name: "John"})') ).to eq "OK"
  end
end
