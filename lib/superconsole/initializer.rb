require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'hirb'
require 'superconsole/printer'
require 'superconsole/prompt_builder/main'
require 'superconsole/prompt_builder/wait'

module Superconsole
  class Initializer

    def initialize(app)
      Superconsole.app = app
    end

    def call
      Pry.config.print       = Printer
      Pry.config.prompt      = [PromptBuilder::Main, PromptBuilder::Wait]
      Hirb.enable
    end
  end
end
