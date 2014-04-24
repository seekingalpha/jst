require 'spec_helper'

describe JST::Configuration do

  subject(:config) do
    JST::Configuration.new
  end

  before do
    config.templates_path = '/path/to/templates'
    config.output =         '/path/to/output.js'
  end

  it "should respond to templates_path" do
    expect( config.templates_path ).to eq '/path/to/templates'
  end

  it "should respond to output" do
    expect( config.output ).to eq '/path/to/output.js'
  end

end
