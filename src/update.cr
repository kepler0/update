require "./update/providers/*"

module Update
  PROVIDERS = [
    Update::Homebrew,
    Update::APM,
    Update::NPM,
    Update::Gems
  ]
end

{% for provider in Update::PROVIDERS %}
  {{provider}}.update if {{provider}}.installed?
{% end %}
