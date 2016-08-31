require "../provider"

module Update::Providers::NPM
  extend Provider
  extend self

  EXECUTABLE = "npm"
  STUFF = "Node Packages"

  def update
    run_update "update -g"
  end
end
