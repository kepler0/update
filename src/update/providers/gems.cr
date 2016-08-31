require "../provider"

module Update::Providers::Gems
  extend Provider
  extend self

  EXECUTABLE = "gem"
  STUFF = "Ruby Gems"

  def update
    run_update "update"
  end
end
