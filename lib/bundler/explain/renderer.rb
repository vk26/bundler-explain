require 'tty-tree'

module Bundler
  module Explain
    class Renderer
      def initialize(dependency_tree)
        @dependency_tree = dependency_tree
      end

      def call
        tree = TTY::Tree.new(@dependency_tree)
        puts tree.render
      end
    end
  end
end
