module AFROLEGS
  # Allows accessing config variables from afrolegs.yml like so:
  # AFROLEGS[:database_host] => db.myhost.com

  def self.[](key)
    unless @config
      raw_config = File.read("config/afrolegs.yml")
      @config = HashWithIndifferentAccess.new(YAML.load(raw_config))
    end
    @config[key]
  end

  def self.[]=(key, value)
    @config[key.to_sym] = value
  end
end
