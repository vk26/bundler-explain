module Bundler
  module Explain
    class Parser
      attr_reader :locked_specs, :direct_dependencies, :errors

      def initialize(params = {})
        @gemfile = params[:gemfile]
        @gemfile_lock = params[:gemfile_lock]
        @locked_specs = []
        @direct_dependencies = []
        @errors = []
      end

      def call
        begin
          definition = if @gemfile && @gemfile_lock
                         Bundler::Definition.build(@gemfile, @gemfile_lock, nil)
                       else
                         Bundler.definition
                       end
          @locked_specs = definition.gem_version_promoter.locked_specs.map do |spec|
            Bundler::Explain::LockedSpec.new(spec)
          end
          @direct_dependencies = definition.dependencies.map do |dep|
            Bundler::Explain::Dependency.new(dep)
          end
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
