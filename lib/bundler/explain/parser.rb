module Bundler
  module Explain
    class Parser
      def initialize(file)
        @file = file
      end

      def call
        # TODO: convert structured text of Gemfile.lock to hash
      end
    end
  end
end
