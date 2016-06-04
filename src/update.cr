require "./update/providers/*"

module Update
  PROVIDERS = [
    Update::Providers::Homebrew,
    Update::Providers::APM,
    Update::Providers::NPM,
    Update::Providers::Gems,
    Update::Providers::AppStore
  ]
end

{% for provider in Update::PROVIDERS %}
  {{provider}}.update if {{provider}}.installed?
{% end %}
