require 'spec_helper'

describe JST::Template::PrototypeJS do
  subject do
    JST::Template::PrototypeJS.new("spec/fixtures/hello.jst")
  end

  let(:template_content){ %(<h1>Hello, <a href="#foo">\#{name}</a></h1>\n) }

  let(:expected_result) do
    %(this.Templates["hello"] = function(context){ return new Template(#{template_content.inspect}).evaluate(context); })
  end

  its(:to_jst){ should eq expected_result }
end
