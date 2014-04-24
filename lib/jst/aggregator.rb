class JST::Aggregator
  def initialize(templates_path=JST.config.templates_path)
    @templates_path = templates_path
  end

  def save(output=JST.config.output)
    File.write(output, aggregate)
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
    Dir.glob(@templates_path + "/*.jst")
  end
end
