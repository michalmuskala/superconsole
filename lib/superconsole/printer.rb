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
        pager.print ap_value
      end
    end

    private

    def ap_value
      @value.ai(indent: 2)
    end

    def output(&block)
      @output << @pry.pager.open(&block)
    end
  end
end
