$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yaml'

require 'simplecov'
SimpleCov.start
require 'hackpad/generate/index'

def load_test_config
  YAML.load_file File.expand_path('../test_config.yml', __FILE__)
end
