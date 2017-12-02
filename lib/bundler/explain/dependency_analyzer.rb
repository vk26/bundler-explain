module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(from_gemfile, dependencies, gem_name)
        @from_gemfile = from_gemfile
        @dependencies = dependencies
        @gem_name = gem_name
      end

      def call
        { @gem_name => build_tree_dependencies(@gem_name) }
      end

      protected

      def build_tree_dependencies(current_gem)
        @dependencies.select { |_, v| v.include? current_gem }.keys.map do |dep|
          if @from_gemfile.include? dep
            { dep => nil }
          else
            { dep => build_tree_dependencies(dep) }
          end
        end
      end
    end
  end
end
