require "./utils"
require "yaml"

module Update
  class Provider
    include Utilities

    YAML.mapping(
      stuff: String,
      executable: String,
      command: { type: String, nilable: true },
      commands: { type: Array(String), nilable: true },
      sudo: { type: Bool, default: false }
    )

    def installed?
      test "type #{executable}"
    end

    def update
      banner "Updating #{stuff}"
      run (commands || { command }).map { |com| build_command com }.join(" && ")
    end

    private def build_command(com)
      "#{"sudo" if sudo} #{executable} #{com}".strip
    end
  end
end
