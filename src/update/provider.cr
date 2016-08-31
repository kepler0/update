require "./util"

module Update
  PROVIDERS = [] of Provider

  module Provider
    include Utilities
    extend self

    macro extended
      PROVIDERS << {{@type}}

      def executable
        {{@type}}::EXECUTABLE
      end

      def stuff
        {{@type}}::STUFF
      end
    end

    def executable
    end

    def installed?
      test "type #{executable}"
    end

    def update
    end

    private def run_update(*commands, sudo = false)
      banner "Updating #{stuff}"
      commands = commands.map { |com| "#{executable} #{com}" }.join(" && ")
      run "#{"sudo" if sudo} #{commands}"
    end
  end
end
