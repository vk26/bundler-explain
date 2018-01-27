module Bundler
  module Explain
    class Parser
      attr_reader :dependencies, :from_gemfile, :errors

      def initialize(params = {})
        @gemfile = params[:gemfile]
        @gemfile_lock = params[:gemfile_lock]
        @dependencies = {}
        @from_gemfile = []
        @errors = []
      end

      def call
        begin
          definition = if @gemfile && @gemfile_lock
                          Bundler::Definition.build(@gemfile, @gemfile_lock, nil)
                       else
                          Bundler.definition
                       end
          @dependencies = definition.gem_version_promoter.locked_specs.map do |dep|
            [dep.name, dep.dependencies.map(&:name)]
          end.to_h
          @from_gemfile = definition.dependencies.map(&:name)
        rescue => e
          errors.push e
        end && self
      end

      def success?
        errors.empty?
      end
    end
  end
end
