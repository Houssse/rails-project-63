# frozen_string_literal: true

require_relative "hexlet_code/version"

# The HexletCode module provides tools for building HTML forms and tags.
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

  def self.form_for(_object, **attributes)
    attributes_string = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join(" ")
    attributes_url = attributes_string.split

    if attributes.key?(:url)
      "<form action=\"#{attributes[:url]}\" method=\"post\" #{attributes_url[1]}></form>"
    else
      "<form action=\"#\" method=\"post\"#{attributes_string}></form>"
    end
  end
end
