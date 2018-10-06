require 'spec_helper'

describe Bundler::Explain::DependencyAnalyzer do
  let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
  let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }
  let(:direct_dependencies) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.direct_dependencies }
  let(:locked_specs) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.locked_specs }

  context 'simple consistantly dependencies' do
    let(:gem) { 'nio4r' }
    subject { Bundler::Explain::DependencyAnalyzer.new(direct_dependencies, locked_specs, gem).call }

    it 'find dependencies for gem' do
      expect(subject.dependencies_names).to include ( { "nio4r" =>[{ "actioncable"=> [{"rails" => [] }] }] } )
    end
  end

  context 'more complex dependencies' do
    let(:gem) { 'globalid' }
    subject { Bundler::Explain::DependencyAnalyzer.new(direct_dependencies, locked_specs, gem).call }

    it 'find dependencies for gem' do
      binding.pry
      expect(subject.dependencies_names).to include ( {"globalid" => [{"activejob" => [{"actionmailer" => [{"rails" => []}]}, {"rails" => []}]}]} )
    end
  end
end
