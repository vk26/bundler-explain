module Bundler
  module Explain
    class DependencyAnalyzer
      def initialize(from_gemfile, dependencies, gem_name)
        @from_gemfile = from_gemfile
        @dependencies = dependencies
        @gem_name = gem_name
      end

      def call
        find_recursive(@gem_name)
      end

      protected

      def find_recursive(current_gem, finded_dependencies = [])
        finded_dependencies.push current_gem if current_gem == @gem_name
        dep = @dependencies.select { |_, v| v.include? current_gem }.keys.first
        finded_dependencies.push dep
        if @from_gemfile.include? dep
          return finded_dependencies
        else
          find_recursive(dep, finded_dependencies)
        end
      end
    end
  end
end
