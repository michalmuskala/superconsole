require 'superconsole/prompt_builder/base'

module Superconsole
  module PromptBuilder
    class Main < Base

      private

      def intro
        "#{line.white}#{name.yellowish}#{environment.blueish}#{target}"
      end
    end
  end
end
