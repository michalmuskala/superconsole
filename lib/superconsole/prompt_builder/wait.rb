require 'superconsole/prompt_builder/base'

module Superconsole
  module PromptBuilder
    class Wait < Base

      private

      def intro
        ' ' * space_size
      end

      def space_size
        line.size + name.size + environment.size + target.size
      end
    end
  end
end
