module Superconsole
  class Printer
    def self.call(*args)
      new(*args).call
    end

    def initialize(output, value, pry)
      @output = output
      @value  = value
      @pry    = pry
    end

    def call
      output do |pager|
        pager.print @pry.config.output_prefix
        pager.print formatted_value
      end
    end

    private

    def formatted_value
      hirb_value || ap_value
    end

    def ap_value
      @value.ai(indent: 2)
    end

    def hirb_value
      last_hirb_output = nil
      Hirb::View.render_method = proc { |text| last_hirb_output = "\n#{text}" }
      Hirb::View.view_output(@value) ? last_hirb_output : nil
    end

    def output(&block)
      @output << @pry.pager.open(&block)
    end
  end
end
