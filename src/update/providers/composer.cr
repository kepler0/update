require "../provider"

module Update::Providers::Composer
  extend Provider
  extend self

  def installed?
    test "composer -v"
  end

  def update
    banner "Updating Composer Packages"
    run "composer global update"
  end
end
