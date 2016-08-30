require "./update/providers/*"

Update::PROVIDERS.each do |provider|
  provider.update if provider.installed?
end
