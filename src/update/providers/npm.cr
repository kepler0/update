require "../provider"

module Update
  module NPM
    extend Provider
    extend self

    def installed?
      test "npm -v"
    end

    def update
      banner "Updating Node Package Manager Packages"
      run "npm update -g"
    end
  end
end
