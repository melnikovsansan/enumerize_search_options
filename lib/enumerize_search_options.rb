require 'enumerize_search_options/version'
require 'enumerize'
require 'enumerize_search_options/search_options'

module EnumerizeSearchOptions
  ::Enumerize.module_eval do
    class << self

      def extended_with_search_options(base)
        extended_without_search_options(base)
        base.extend SearchOptions
      end

      alias_method :extended_without_search_options, :extended
      alias_method :extended, :extended_with_search_options
    end
  end
end
