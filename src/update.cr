require "./update/provider"

yaml = {{ `cat #{__DIR__}/providers.yml`.stringify }}

providers = Array(Update::Provider).from_yaml yaml

user_yaml = File.read File.join(`printf $HOME`, ".update.yml")
user_providers = Array(Update::Provider).from_yaml user_yaml

user_providers.each do |user_provider|
  provider = providers.find &.==(user_provider)
  next providers << user_provider unless provider
  provider.merge! user_provider
end

providers.each &.update
