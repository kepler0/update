require "../provider"

module Update::Providers::APM
  extend Provider
  extend self

  EXECUTABLE = "apm"
  STUFF = "Atom Packages"

  def update
    run_update "update --confirm false"
  end
end
