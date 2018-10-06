require 'spec_helper'

describe Bundler::Explain::Renderer do
  let(:gemfile) { "#{base_examples_folder}/case1/Gemfile" }
  let(:gemfile_lock) { "#{base_examples_folder}/case1/Gemfile.lock" }
  let(:direct_dependencies) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.direct_dependencies }
  let(:locked_specs) { Bundler::Explain::Parser.new(gemfile: gemfile, gemfile_lock: gemfile_lock).call.locked_specs }
  let(:gem) { 'rails-html-sanitizer' }
  let(:dependency_tree) do
    Bundler::Explain::DependencyAnalyzer.new(direct_dependencies, locked_specs, gem).call.dependencies_names
  end

  describe '#call' do
    subject { described_class.new(dependency_tree).call }
    it 'return formatted output dependencies tree' do
      expect(subject).to eq "rails-html-sanitizer
├── actionview
│   ├── actionpack
│   │   ├── actioncable
│   │   │   └── rails
│   │   ├── actionmailer
│   │   │   └── rails
│   │   ├── railties
│   │   │   ├── coffee-rails
│   │   │   ├── rails
│   │   │   ├── sass-rails
│   │   │   └── web-console
│   │   ├── sprockets-rails
│   │   │   ├── rails
│   │   │   └── sass-rails
│   │   └── rails
│   ├── actionmailer
│   │   └── rails
│   ├── rails
│   └── web-console
└── actionpack
    ├── actioncable
    │   └── rails
    ├── actionmailer
    │   └── rails
    ├── railties
    │   ├── coffee-rails
    │   ├── rails
    │   ├── sass-rails
    │   └── web-console
    ├── sprockets-rails
    │   ├── rails
    │   └── sass-rails
    └── rails
"
    end
  end
end
