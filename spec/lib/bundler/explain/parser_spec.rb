require 'spec_helper'

describe Bundler::Explain::Parser do
  describe '#call' do
    let(:gemfile) { File.expand_path("#{File.dirname(__FILE__)}/../../../examples/case1/Gemfile") }
    let(:gemfile_lock) { File.expand_path("#{File.dirname(__FILE__)}/../../../examples/case1/Gemfile.lock") }

    subject { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call }

    it 'processing success' do
      expect(subject.success?).to eq true
    end

    it 'return dependencies from Gemfile.lock' do
      expect(subject.dependencies.count).to eq 69
      expect(subject.dependencies["activesupport"]).to match_array ["concurrent-ruby", "i18n", "minitest", "tzinfo"]
      expect(subject.dependencies["actioncable"]).to match_array ["actionpack", "nio4r", "websocket-driver"]
    end

    it 'return dependencies from Gemfile' do
      expect(subject.from_gemfile).to match_array %w(
        rails sqlite3 puma sass-rails uglifier coffee-rails turbolinks jbuilder byebug
        capybara selenium-webdriver web-console listen spring spring-watcher-listen tzinfo-data
      )
    end
  end
end
