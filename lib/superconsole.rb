require 'superconsole/version'
require 'superconsole/railtie' if defined?(Rails)
require 'superconsole/initializer'

module Superconsole
  module_function

  attr_writer :feed

  def feed
    @feed ||= "\u00BB"
  end

  def init(app = nil)
    Initializer.new(app).call
  end

  def start
    init
    Pry.start
  end
end
