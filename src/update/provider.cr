require "./util"

module Update
  PROVIDERS = [] of Provider

  module Provider
    include Utilities
    extend self

    macro extended
      PROVIDERS << {{@type}}
    end

    def installed?
    end

    def update
    end
  end
end
