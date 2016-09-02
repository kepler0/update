require "./update/provider"

yaml = File.read File.join(__DIR__, "providers.yml")

providers = Array(Update::Provider).from_yaml yaml

providers.each do |provider|
  provider.update if provider.installed?
end
