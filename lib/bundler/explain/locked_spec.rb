module Bundler
  module Explain
    class LockedSpec
      attr_reader :dependencies, :name, :version

      def initialize(bundler_spec)
        @name = bundler_spec.name
        @version = bundler_spec.version.to_s
        @dependencies = []
        if bundler_spec.dependencies
          bundler_spec.dependencies.each do |dependency|
            @dependencies.push Bundler::Explain::Dependency.new(dependency)
          end
        end
      end
    end
  end
end
