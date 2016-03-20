require "../provider"

module Update::Providers::APM
  extend Provider
  extend self

  def installed?
    test "apm"
  end

  def update
    banner "Updating Atom Package Manager Packages"
    run "apm update --confirm false"
  end
end
