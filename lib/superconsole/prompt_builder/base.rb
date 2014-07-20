module Superconsole
  module PromptBuilder
    class Base
      def self.call(*args)
        new(*args).call
      end

      # Comply with pry expecting proc
      def self.arity
        method(:call).arity
      end

      def initialize(nest_target, nest_level, pry)
        @nest_target = Pry.view_clip(nest_target)
        @level = [nest_level, 0].max
        @pry = pry
      end

      def call
        "#{intro} #{Superconsole.feed.red} "
      end

      private

      def name
        @name ||= Superconsole.app.class.parent_name.underscore
      end

      def environment
        @environment ||= "##{Rails.env}"
      end

      def intro
        ''
      end

      def line
        @line ||= "[#{@pry.input_array.size}] "
      end

      def level
        '../' * @level
      end

      def target
        @target ||= @nest_target == 'main' ? '' : " (#{level}#{@nest_target})"
      end
    end
  end
end
