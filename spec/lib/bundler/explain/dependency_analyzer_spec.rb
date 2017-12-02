require 'spec_helper'

describe Bundler::Explain::DependencyAnalyzer do
  let(:gemfile) { File.expand_path("#{File.dirname(__FILE__)}/../../../examples/case1/Gemfile") }
  let(:gemfile_lock) { File.expand_path("#{File.dirname(__FILE__)}/../../../examples/case1/Gemfile.lock") }
  let(:from_gemfile) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.from_gemfile }
  let(:dependencies) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.dependencies }

  context 'simple consistantly dependencies' do
    let(:gem) { 'nio4r' }
    subject { Bundler::Explain::DependencyAnalyzer.new(from_gemfile, dependencies, gem).call }

    it 'find dependencies for gem' do
      expect(subject).to eq ['nio4r', 'actioncable', 'rails']
    end
  end
end
