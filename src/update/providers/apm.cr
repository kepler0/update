require "../provider"

module Update
  module APM
    extend Provider
    extend self

    def installed?
      test "apm"
    end

    def update
      banner "Updating Atom Package Manager Packages"
      run "apm update"
    end
  end
end
