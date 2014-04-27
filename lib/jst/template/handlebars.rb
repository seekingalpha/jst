module JST::Template
  class Handlebars < Base
    private

    def as_jst
      %(Handlebars.compile(#{content.inspect})(context);)
    end
  end
end
