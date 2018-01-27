module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(direct_dependencies, locked_specs, gem_name)
        @direct_dependencies = direct_dependencies
        @locked_specs = locked_specs
        @gem_name = gem_name
      end

      def call
        root_locked_spec.dependencies = find_dependencies(@gem_name)
        root_locked_spec
      end

      protected

      def find_dependencies(current_gem)
        @locked_specs.select { |spec| dependencies_include?(spec.dependencies, current_gem) }.map do |spec|
          if dependencies_include?(@direct_dependencies, spec.name)
            spec.dependencies = []
          else
            spec.dependencies = find_dependencies(spec.name)
          end
          spec
        end
      end

      def root_locked_spec
        @root_locked_spec ||= Bundler::Explain::LockedSpec.new(name: @gem_name)
      end

      def dependencies_include?(dependencies, name)
        dependencies.select { |dep| dep.name == name }.any?
      end
    end
  end
end
