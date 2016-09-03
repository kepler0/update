require "./update/provider"

yaml = {{ `cat #{__DIR__}/providers.yml`.stringify }}

providers = Array(Update::Provider).from_yaml yaml

providers.each do |provider|
  provider.update if provider.installed?
end
