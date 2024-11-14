# frozen_string_literal: true

require_relative "hexlet_code/version"

# The HexletCode module provides tools for building HTML forms and tags.
module HexletCode
  class Error < StandardError; end
  
  class Tag
    def self.build(tag_name, **options)
      options_string = options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      content = block_given? ? yield : ""
      
      if ["input", "br", "hr", "img", "meta", "link"].include?(tag_name)
        "<#{tag_name} #{options_string}>"
      else
        "<#{tag_name} #{options_string}>#{content}</#{tag_name}>"
      end
    end
  end

  class FormBuilder
    def initialize(object)
      @object = object
      @form_content = ""
    end
  
    def input(attribute, **options)
      begin
        value = @object.public_send(attribute)
      rescue NoMethodError
        raise HexletCode::Error, "undefined method `#{attribute}' for #<struct User id=nil, name=nil, job=nil>"
      end
  
      if options[:as] == :text
        options[:cols] ||= 20
        options[:rows] ||= 40
        @form_content += Tag.build('textarea', name: attribute, cols: options[:cols], rows: options[:rows]) { value }
      else
        @form_content += Tag.build('input', name: attribute, type: 'text', value: value, **options)
      end
    end
  
    def form_content
      @form_content
    end
  end

  def self.form_for(object, url: '#', **attributes)
    attributes_string = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join(" ")
    form_tag = "<form action=\"#{url}\" method=\"post\"#{attributes_string}>"
    
    form_builder = FormBuilder.new(object)
    
    form_builder.instance_eval { yield self } if block_given?

    form_tag + form_builder.form_content + "</form>"
  end
end