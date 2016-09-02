require "colorize"

module Update::Utilities
  extend self

  private def test(command, args = nil)
    status = Process.run(command, args, shell: true, input: false, output: false, error: false)
    status.success?
  end

  private def run(command, args = nil)
    Process.run(command, args, shell: true, input: false, output: true, error: true)
  end

  private def print_stylized(*strings)
    strings.each do |string|
      puts string.to_s.colorize(:light_magenta).mode(:bold)
    end
  end

  private def banner(text)
    line = "=" * (text.size + 2)
    print_stylized(
      nil,
      line,
      " #{text} ",
      line,
      nil
    )
  end
end
