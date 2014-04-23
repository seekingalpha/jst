class JST::Template
  def initialize(path)
    @path = path
  end

  def to_jst
    <<-JST
this.Templates[#{name.inspect}] = function(context){
  return new Template(#{content.inspect}).evaluate(context);
}
    JST
  end

  private

  def name
    File.basename(@path, ".jst")
  end

  def content
    File.read(@path)
  end
end
