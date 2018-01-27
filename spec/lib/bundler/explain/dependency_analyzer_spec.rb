require 'spec_helper'

describe Bundler::Explain::DependencyAnalyzer do
  let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
  let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }
  let(:from_gemfile) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.from_gemfile }
  let(:dependencies) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.dependencies }

  context 'simple consistantly dependencies' do
    let(:gem) { 'nio4r' }
    subject { Bundler::Explain::DependencyAnalyzer.new(from_gemfile, dependencies, gem).call }

    it 'find dependencies for gem' do
      expect(subject).to include ( { "nio4r" =>[{ "actioncable"=> [{"rails" => nil }] }] } )
    end
  end

  context 'more complex dependencies' do
    let(:gem) { 'globalid' }
    subject { Bundler::Explain::DependencyAnalyzer.new(from_gemfile, dependencies, gem).call }

    it 'find dependencies for gem' do
      expect(subject).to include ( {"globalid" => [{"activejob" => [{"actionmailer" => [{"rails" => nil}]}, {"rails" => nil}]}]} )
    end
  end
end
