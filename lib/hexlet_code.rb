# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload(:Tag, "hexlet_code/tag")
autoload(:FormBuilder, "hexlet_code/form_builder")

# The HexletCode module provides tools for building HTML forms and tags.
module HexletCode
  class Error < StandardError; end

  # Class for building HTML forms.
  class FormBuilder
    def initialize(object)
      @object = object
      @form_content = ""
      @submit_added = false
    end

    def input(attribute, **options) # rubocop:disable Metrics/MethodLength
      value = fetch_attribute_value(attribute)

      build_label(attribute)

      if options[:as] == :text
        options[:cols] ||= 20
        options[:rows] ||= 40
        @form_content += Tag.build("textarea", name: attribute,
                                               id: "input_#{attribute}",
                                               cols: options[:cols],
                                               rows: options[:rows]) { value }
      else
        @form_content += Tag.build("input", name: attribute,
                                            id: "input_#{attribute}",
                                            type: "text",
                                            value: value, **options)
      end
    end

    def submit(value: "Save")
      @submit_added = true
      @form_content += Tag.build("input", type: "submit", value: value)
    end

    def build_label(attribute)
      label_text = attribute.to_s.capitalize
      input_id = "input_#{attribute}"
      @form_content += Tag.build("label", for: input_id) { label_text }
    end

    def fetch_attribute_value(attribute)
      @object.public_send(attribute)
    rescue NoMethodError
      raise HexletCode::Error, "undefined method `#{attribute}' for #<struct User id=nil, name=nil, job=nil>"
    end

    attr_reader :form_content, :submit_added
  end

  def self.form_for(object, url: "#", **attributes)
    attributes_string = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join(" ")
    form_tag = "<form action=\"#{url}\" method=\"post\"#{attributes_string}>"

    form_builder = FormBuilder.new(object)

    form_builder.instance_eval { yield self } if block_given?

    form_builder.submit unless form_builder.submit_added

    "#{form_tag}#{form_builder.form_content}</form>"
  end
end
