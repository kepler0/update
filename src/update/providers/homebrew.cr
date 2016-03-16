require "../provider"

module Update
  module Homebrew
    extend Provider
    extend self

    def installed?
      test "brew -v"
    end

    def update
      banner "Updating Homebrew and Homebrew Packages"
      run "brew update && brew upgrade"
    end
  end
end
