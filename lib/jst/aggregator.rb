class JST::Aggregator
  def initialize(path)
    @path = path
  end

  def save(path)
    File.write(path, aggregate)
  end

  def aggregate
    <<-JST
      (function() {
        this.Templates = {};
        #{process_all}
      }).call(this);
    JST
  end

  alias :to_s :aggregate

  private

  def process_all
    jst_files.map do |file|
      JST::Template.new(file).to_jst
    end.join("\n")
  end

  def jst_files
    Dir.glob(@path + "/*.jst")
  end
end
