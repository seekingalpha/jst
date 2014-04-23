require 'spec_helper'

describe JST::Template do
  subject do
    JST::Template.new("spec/fixtures/hello.jst")
  end

  let(:template_content){ %(<h1>Hello, <a href="#foo">\#{name}</a></h1>\n) }
  
  let(:expected_result) do
    <<-RESULT
this.Templates["hello"] = function(context){
  return new Template(#{template_content.inspect}).evaluate(context);
}
    RESULT
  end

  its(:to_jst){ should eq expected_result }
end
