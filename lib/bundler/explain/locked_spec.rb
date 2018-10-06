module Bundler
  module Explain
    class LockedSpec
      attr_reader :name, :version
      attr_accessor :dependencies, :dependencies_from_me

      def initialize(params)
        @dependencies = []
        @dependencies_from_me = []
        if params.is_a? Hash
          @name = params[:name]
          @version = params[:version]
        else
          bundler_spec = params
          @name = bundler_spec.name
          @version = bundler_spec.version.to_s
          if bundler_spec.dependencies
            bundler_spec.dependencies.each do |dependency|
              @dependencies.push Bundler::Explain::Dependency.new(dependency)
            end
          end
        end
      end

      def dependencies_names
        dependencies_to_h(self)
      end

      protected

      def dependencies_to_h(spec)
        if spec.dependencies_from_me.empty?
          { spec.name => [] }
        else
          { spec.name => spec.dependencies_from_me.map { |dep| dependencies_to_h(dep) } }
        end
      end
    end
  end
end
