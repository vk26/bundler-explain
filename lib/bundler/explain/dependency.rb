module Bundler
  module Explain
    class Dependency
      attr_reader :name, :requirement

      def initialize(bundler_dependency)
        @name = bundler_dependency.name
        @requirement = bundler_dependency.requirement.to_s
      end
    end
  end
end
