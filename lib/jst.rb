module JST
  autoload :Aggregator,    'jst/aggregator'
  autoload :Configuration, 'jst/configuration'
  autoload :Template,      'jst/template'
  autoload :Version,       'jst/version'

  def self.configure
    yield @@config ||= Configuration.new
  end

  def self.config
    @@config
  end

  def self.process!
    Aggregator.new.save
  end
end
