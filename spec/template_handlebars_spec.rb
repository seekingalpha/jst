require 'spec_helper'

describe JST::Template::Handlebars do
  subject do
    JST::Template::Handlebars.new("spec/fixtures/hellohb.jst.hb")
  end

  let(:template_content){ %(<h1>Hello, <a href="#foo">{{name}}</a></h1>\n) }

  let(:expected_result) do
    %(this.Templates["hellohb"] = function(context){ return Handlebars.compile(#{template_content.inspect})(context); })
  end

  its(:to_jst){ should eq expected_result }
end
