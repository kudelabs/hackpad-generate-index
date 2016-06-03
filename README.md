# Hackpad::Generate::Index

A tool for generate an index page and upload it to your Hackpad.

## Installation

This gem isn't push to rubygems.org yet, so please checkout this project and use it directly, via command below:

```bash

git clone https://github.com/kudelabs/hackpad-generate-index
cd hackpad-generate-index
bundle install

bundle exec bin/hackpad-generate-index --title='Whatever you want' --site='https://xxx.hackpad.com --client_id=id --secret=secret
```

## Usage

```bash
Commands:
  hackpad-generate-index generate_index --client-id=CLIENT_ID --secret=SECRET --site=SITE  # Generate index with Hackpad's API
  hackpad-generate-index help [COMMAND]                                                    # Describe available commands or one specific command
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kudelabs/hackpad-generate-index.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
