module EnumerizeSearchOptions
  module SearchOptions
    def enumerize(name, options={})
      super

      if options[:search_options]
        unless methods.include?("#{name}_search_options")
          _enumerize_module._class_methods.module_eval <<-RUBY, __FILE__, __LINE__ + 1
            def #{name}_search_options(except: nil)
              values = #{name}.values
              except = #{options[:search_options]}.try :[], :except if except.nil?
              values -= Array(except).map(&:to_s) if except.present?
              values.map { |v| [v.text, v.value] }
            end
          RUBY
        end
      end
    end
  end
end