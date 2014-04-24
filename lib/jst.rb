module JST
  autoload :Aggregator,    'jst/aggregator'
  autoload :Configuration, 'jst/configuration'
  autoload :Template,      'jst/template'
  autoload :Version,       'jst/version'

  def self.configure
    @@config = Configuration.new
    yield @@config
  end
end
