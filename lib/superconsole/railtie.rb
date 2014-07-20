require 'pry-rails'
require 'superconsole/initializer'

module Superconsole
  class Railtie < Rails::Railtie
    initializer 'superconsole.initialize' do |app|
      Superconsole.init(app)
    end
  end
end
