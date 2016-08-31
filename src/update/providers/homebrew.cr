require "../provider"

module Update::Providers::Homebrew
  extend Provider
  extend self

  EXECUTABLE = "brew"
  STUFF = "Homebrew and Homebrew Packages"

  def update
    run_update "update", "upgrade"
  end
end
