module Bundler
  module Explain
    class LockedSpec
      attr_reader :name, :version
      attr_accessor :dependencies

      def initialize(params)
        @dependencies = []
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
        if spec.dependencies.empty?
          { spec.name => [] }
        else
          { spec.name => spec.dependencies.map { |dep| dependencies_to_h(dep) } }
        end
      end
    end
  end
end
