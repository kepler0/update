require "../provider"

module Update::Providers::AppStore
  extend Provider
  extend self

  EXECUTABLE = "softwareupdate"
  STUFF = "OS X and App Store installed apps"

  def update
    run_update "-v --install --all", sudo: true
  end
end
