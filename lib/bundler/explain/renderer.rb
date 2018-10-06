require 'tty-tree'

module Bundler
  module Explain
    class Renderer
      def initialize(dependency_tree)
        @dependency_tree = dependency_tree
      end

      def call
        formatter.tap do |formatted_tree|
          puts formatted_tree
        end
      end

      protected

      def formatter
        TTY::Tree.new(@dependency_tree).render
      end
    end
  end
end
