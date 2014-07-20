require 'superconsole/version'
require 'superconsole/railtie' if defined?(Rails)
require 'superconsole/initializer'

module Superconsole
  mattr_accessor :feed
  self.feed = '‣'

  mattr_accessor :app
end
