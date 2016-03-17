require "../provider"

module Update::Providers::Gems
  extend Provider
  extend self

  def installed?
    test "gem -v"
  end

  def update
    banner "Updating Ruby Gems"
    run "gem update"
  end
end
