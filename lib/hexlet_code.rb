# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # Class for building HTML tags and generating form elements.
  # This class provides the `build` method to quickly create HTML tags with various options.
  class Tag
    def self.build(tag_name, **options)
      options_string = options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

      if block_given?
        content = yield
        return "<#{tag_name}>#{content}</#{tag_name}>" if options.empty?

        "<#{tag_name} #{options_string}>#{content}</#{tag_name}>"
      elsif options.empty?
        tag_name == "br" ? "<#{tag_name}>" : "<#{tag_name}></#{tag_name}>"
      else
        "<#{tag_name} #{options_string}>"
      end
    end
  end
end
