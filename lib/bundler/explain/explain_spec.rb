module Bundler
  module Explain
    class ExplainSpec
      attr_accessor :dependencies

      def initialize(bundler_spec)
        @name = bundler_spec.name
        @version = bundler_spec.version.to_s
        @dependencies = []
      end
    end
  end
end
