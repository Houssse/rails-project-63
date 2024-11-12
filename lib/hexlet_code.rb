# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  
  class Tag
    def self.build(tag_name, **options)
      options_string = options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
  
      if block_given?
        content = yield
        if options.empty? 
          return "<#{tag_name}>#{content}</#{tag_name}>" 
        else
          return "<#{tag_name} #{options_string}>#{content}</#{tag_name}>"
        end
      end

      if options.empty?
        tag_name == 'br' ? "<#{tag_name}>" : "<#{tag_name}></#{tag_name}>" 
      else
        "<#{tag_name} #{options_string}>"
      end
    end
  end
end