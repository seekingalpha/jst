require 'spec_helper'

describe JST::Template do
  describe '.parse' do
    context 'prototypejs extension' do
      it 'should instanciate PrototypeJS' do
        allow_any_instance_of(JST::Template::PrototypeJS).to receive(:to_jst).and_return("OK")
        result = JST::Template.parse('/test.jst.pt')

        expect(result).to eq('OK')
      end
    end

    context 'no extension' do
      it 'should instanciate PrototypeJS' do
        allow_any_instance_of(JST::Template::PrototypeJS).to receive(:to_jst).and_return("OK")
        result = JST::Template.parse('/test.jst')

        expect(result).to eq('OK')
      end
    end

    context 'handle bars extension' do
      it 'should instanciate HandleBars' do
        allow_any_instance_of(JST::Template::Handlebars).to receive(:to_jst).and_return("OK")
        result = JST::Template.parse('/test.jst.hb')

        expect(result).to eq('OK')
      end
    end
  end
end
