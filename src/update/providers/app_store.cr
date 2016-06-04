require "../provider"

module Update::Providers::AppStore
  extend Provider
  extend self

  def installed?
    test "softwareupdate -h"
  end

  def update
    banner "Updating OS X and App Store installed apps"
    run "sudo softwareupdate -v --install --all"
  end
end
