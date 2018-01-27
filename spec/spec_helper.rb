require 'bundler/explain'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'
require 'rspec/its'

def base_examples_folder
  "#{File.dirname(__FILE__)}/examples"
end

RSpec.configure do |config|
end
