require 'spec_helper'

describe Bundler::Explain::Parser do
  describe '#call' do
    let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
    let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }

    subject { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call }

    its(:success?) { is_expected.to be_truthy }

    describe '#locked_specs' do
      its('locked_specs.count') { is_expected.to eq 69 }
      it 'return correct locked dependencies' do
        locked_spec_dependencies = subject.locked_specs.select { |dep| dep.name == 'activesupport' }.first.dependencies
        expect(locked_spec_dependencies.map(&:name)).to match_array ["concurrent-ruby", "i18n", "minitest", "tzinfo"]

        locked_spec_dependencies = subject.locked_specs.select { |dep| dep.name == 'actioncable' }.first.dependencies
        expect(locked_spec_dependencies.map(&:name)).to match_array ["actionpack", "nio4r", "websocket-driver"]
      end
    end

    describe '#direct_dependencies' do
      it 'return array dependencies from gemfile' do
        expect(subject.direct_dependencies.map(&:name)).to match_array %w(
          rails sqlite3 puma sass-rails uglifier coffee-rails turbolinks jbuilder byebug
          capybara selenium-webdriver web-console listen spring spring-watcher-listen tzinfo-data
        )
      end
    end
  end
end
