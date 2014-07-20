require 'superconsole/prompt_builder/base'

module Superconsole
  module PromptBuilder
    class Wait < Base

      private

      def intro
        ' ' * (line.size + name.size + target.size)
      end
    end
  end
end
