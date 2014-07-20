require 'pry-rails'
require 'superconsole/initializer'

module Superconsole
  class Railtie < ::Rails::Railtie
    initializer 'superconsole.initialize' do |app|
      Initializer.new(app).call
    end
  end
end
