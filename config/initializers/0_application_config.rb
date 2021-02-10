class ApplicationConfig
  URI_REGEXP = %r{(?<scheme>https?://)?(?<host>.+?)(?<port>:\d+)?$}.freeze

  def self.[](key)
    if ENV.key?(key)
      ENV[key]
    else
      Rails.logger.debug("Unset ENV variable: #{key}.")
      nil
    end
  end
end
