require "../provider"

module Update::Providers::Composer
  extend Provider
  extend self

  EXECUTABLE = "composer"
  STUFF = "Composer Packages"

  def update
    run_update "global update"
  end
end
