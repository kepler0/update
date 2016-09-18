require "./utils"
require "yaml"

module Update
  class Provider
    include Utilities

    YAML.mapping(
      stuff: { type: String, nilable: true },
      enabled: { type: Bool, default: true },
      equal: { type: String, nilable: true },
      executable: String,
      command: { type: String, nilable: true },
      commands: { type: Array(String), nilable: true },
      sudo: { type: Bool, nilable: true }
    )

    def ==(other : self)
      executable == other.executable
    end

    def merge!(other : self)
      {% for field in %i(stuff enabled executable command commands sudo) %}
        self.{{field.id}} = other.{{field.id}} unless other.{{field.id}}.nil?
      {% end %}
    end

    def replaceable?(other : self)
      executable == other.equal
    end

    private def installed?
      test "type #{executable}"
    end

    def updatable?
      enabled && installed?
    end

    def update
      return false unless updatable?
      banner "Updating #{stuff}"
      run (commands || { command }).map { |com| build_command com }.join(" && ")
    end

    private def build_command(com)
      "#{"sudo" if sudo} #{executable} #{com}".strip
    end
  end
end
