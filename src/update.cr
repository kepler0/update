require "./update/provider"

# Embed a copy of the default Providers in the binary.
yaml = {{ `cat #{__DIR__}/providers.yml`.stringify }}

# Create an Array of Providers from the default data.
providers = Array(Update::Provider).from_yaml yaml

# If the user has a configuration file add its providers to the array.
if (File.exists?(File.join(`printf $HOME`, ".update.yml")))
  user_yaml_file = File.join(`printf $HOME`, ".update.yml")

  user_yaml = File.read user_yaml_file
  user_providers = Array(Update::Provider).from_yaml user_yaml

  user_providers.each do |user_provider|
    provider = providers.find &.==(user_provider)
    next providers << user_provider unless provider
    provider.merge! user_provider
  end
end

# Promote providers than can actually be run.
providers.select! &.updatable?

# Reject any providers that duplicate existing ones. (Use case: pacman)
providers.reject! do |equal_provider|
  orig_provider = providers.find &.replaceable?(equal_provider)
  next false unless orig_provider
  orig_provider.merge! equal_provider
end

# Run all the providers.
providers.each &.update
