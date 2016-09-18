# Update

One stop resource for updating packages installed on your system.

## Installation

From source:
```bash
make
make install
```
Using [Homebrew](https://brew.sh):
```bash
brew install keplersj/tap/update
```

## Usage

Running the `update` binary will check your system for the package managers installed, and run those package managers update and/or upgrade commands.

## Configuration

Create configuration file in `$HOME` directory:
```bash
touch $HOME/.update.yml
```

Insert into this file your providers, or reassign existed.

[`YAML.mapping`](./src/update/provider.cr#L8) as documentation and [`providers.yaml`](./src/providers.yml) as example.

### Supported Package Managers
- [Atom Package Managers](https://atom.io/)
- [Homebrew](http://brew.sh/)
- [Node Package Managers](https://www.npmjs.com/)
- [RubyGems](https://rubygems.org/)
- Mac OS X Update
- App Store
- Arch Linux (with AUR by `pacaur`)

## Contributing

1. Fork it ( https://github.com/keplersj/update/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [@keplersj](https://github.com/keplersj) Kepler Sticka-Jones - creator, maintainer
