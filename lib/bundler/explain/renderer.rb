module Bundler
  module Explain
    class Renderer
      def initialize(dependency_tree)
        @dependency_tree = dependency_tree
      end

      def call
        # TODO: format dependency_tree and output
      end
    end
  end
end
