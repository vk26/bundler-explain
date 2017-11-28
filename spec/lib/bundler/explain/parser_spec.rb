require 'spec_helper'

describe Bundler::Explain::Parser do
  describe '#call' do
    it 'process file to hash' do
      file_path = "#{File.dirname(__FILE__)}/../../../examples/case1/Gemfile.lock"
      result = Bundler::Explain::Parser.new(file_path).call
      expect(result.dig('GEM', 'specs', 'actioncable (5.1.4)').keys).to match_array ['actionpack (= 5.1.4)', 'nio4r (~> 2.0)', 'websocket-driver (~> 0.6.1)']
    end
  end
end
