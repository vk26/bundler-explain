module Bundler
  module Explain
    class Parser
      def initialize(file)
        @file = file
        @tree = {}
      end

      def call
        File.open(@file).each do |line|
          prefix_whitespaces = line[/^\s{1,}/]
          nested_level = prefix_whitespaces.nil? ? 0 : prefix_whitespaces.length / 2
          node_key = line.strip
          if nested_level = 0
            @tree.merge!(node_key: nil)
          else
            last_node_path = []
            nested_level.times do
              last_node_path.push @tree.keys.last
            end
            last_node_path
          end
        end && @tree
      end
    end
  end
end
