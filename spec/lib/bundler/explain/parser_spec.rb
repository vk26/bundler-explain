require 'spec_helper'

describe Bundler::Explain::Parser do
  describe '#call' do
    let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
    let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }

    subject { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call }

    its(:success?) { is_expected.to be_truthy }

    describe '#dependencies' do
      its('dependencies.count') { is_expected.to eq 69 }
      its(:dependencies) { is_expected.to include({ 'activesupport' => ["concurrent-ruby", "i18n", "minitest", "tzinfo"] }) }
      its(:dependencies) { is_expected.to include({ 'actioncable' => ["actionpack", "nio4r", "websocket-driver"] }) }
    end

    describe '#from_gemfile' do
      its(:from_gemfile) { is_expected.to match_array %w(
        rails sqlite3 puma sass-rails uglifier coffee-rails turbolinks jbuilder byebug
        capybara selenium-webdriver web-console listen spring spring-watcher-listen tzinfo-data
      )}
    end
  end
end
