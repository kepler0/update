require "colorize"

module Update::Utilities
  extend self

  private def test(command, args = nil)
    status = Process.run(command, args, shell: true, input: Process::Redirect::Pipe, output: Process::Redirect::Pipe, error: Process::Redirect::Pipe)
    status.success?
  end

  private def run(command, args = nil)
    Process.run(command, args, shell: true, input: Process::Redirect::Pipe, output: Process::Redirect::Inherit, error: Process::Redirect::Inherit)
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
