class JST::Template::Base

  def initialize(path)
    @path = path
  end

  def to_jst
    %(this.Templates[#{name.inspect}] = function(context){ return #{as_jst} })
  end

  private

  def name
    File.basename(@path).split('.').shift
  end

  def content
    File.read(@path)
  end

end
