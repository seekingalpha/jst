require 'spec_helper'

describe JST do

  before do
    JST.configure do |config|
      config.templates_path = '/path/to/templates'
      config.output =         '/path/to/output.js'
    end
  end

  describe '.config' do

    subject(:config) do
      JST.config
    end

    it 'should respond to templates_path' do
      expect( config.templates_path ).to eq '/path/to/templates'
    end

    it 'should respond to output' do
      expect( config.output ).to eq '/path/to/output.js'
    end

  end

  describe '.process!' do

    it 'should delegate to aggregator' do
      allow_any_instance_of(JST::Aggregator).to receive(:save)

      JST.process!
    end

  end

end
