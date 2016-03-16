require "colorize"

module Update
  module Utilities
    extend self

    private def test(command, args = nil)
      status = Process.run(command, args, shell: true, input: false, output: false, error: false)
      status.success?
    end

    private def run(command, args = nil)
      Process.run(command, args, shell: true, input: false, output: true, error: true)
    end

    private def print_bold(text)
      puts text.colorize(:light_magenta).mode(:bold)
    end

    private def banner(text)
      print_bold ""
      print_bold("=" * text.size)
      print_bold text
      print_bold("=" * text.size)
      print_bold ""
    end
  end
end
