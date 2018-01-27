require 'spec_helper'

describe Bundler::Explain::LockedSpec do
  let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
  let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }
  let(:definition) { Bundler::Definition.build(gemfile, gemfile_lock, nil) }
  let(:locked_specs) { definition.gem_version_promoter.locked_specs }

  subject { Bundler::Explain::LockedSpec.new(locked_specs.first) }

  describe '#new' do
    its(:name) { is_expected.to eq 'rake' }
    its(:version) { is_expected.to eq '12.3.0' }
    its(:dependencies) { is_expected.to eq [] }
  end
end
