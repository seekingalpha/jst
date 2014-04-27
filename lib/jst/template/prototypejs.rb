module JST::Template
  class PrototypeJS < Base
    private

    def as_jst
      %(new Template(#{content.inspect}).evaluate(context);)
    end
  end
end
