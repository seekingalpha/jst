module JST::Template

  autoload :Base,        'jst/template/base'
  autoload :PrototypeJS, 'jst/template/prototypejs'
  autoload :Handlebars,  'jst/template/handlebars'

  @@formats = {
    '.pt' => PrototypeJS,
    '.hb' => Handlebars
  }

  @@formats.default = PrototypeJS

  def self.parse(file)
    extension = File.extname(file)

    @@formats[extension].new(file).to_jst
  end

end
