module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(direct_dependencies, locked_specs, gem_name)
        @direct_dependencies = direct_dependencies
        @locked_specs = locked_specs
        @gem_name = gem_name
      end

      def call
        root_locked_spec.dependencies_from_me = find_dependencies(@gem_name)
        root_locked_spec
      end

      protected

      def find_dependencies(current_gem)
        @locked_specs.select { |locked_spec| dependencies_include?(locked_spec.dependencies, current_gem) }.map do |spec|
          if dependencies_include?(@direct_dependencies, spec.name)
            spec.dependencies_from_me = []
          else
            spec.dependencies_from_me += find_dependencies(spec.name)
          end
          spec
        end
      end

      def root_locked_spec
        @root_locked_spec ||= Bundler::Explain::LockedSpec.new(name: @gem_name)
      end

      def dependencies_include?(dependencies, name)
        dependencies.any? { |dep| dep.name == name } rescue binding.pry
      end
    end
  end
end
