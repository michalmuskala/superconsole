require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'superconsole/prompt_builder/main'
require 'superconsole/prompt_builder/wait'

module Superconsole
  class Initializer

    def initialize(app)
      @app = app
    end

    def call
      Pry.config.prompt_name = prompt_name
      Pry.config.print       = print
      Pry.config.prompt      = prompt
    end

    private

    def prompt_name
      @app ? @app.class.parent_name.underscore : File.basename(Dir.pwd)
    end

    def print
      proc do |output, value, _pry_|
        output << _pry_.pager.open do |pager|
          pager.print _pry_.config.output_prefix
          pager.print value.ai(indent: 2)
        end
      end
    end

    def prompt
      [PromptBuilder::Main, PromptBuilder::Wait]
    end
  end
end
