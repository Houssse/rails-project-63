# frozen_string_literal: true

require_relative "hexlet_code/version"
autoload(:Tag, "hexlet_code/tag")
autoload(:FormBuilder, "hexlet_code/form_builder")

# The HexletCode module provides tools for building HTML forms and tags.
module HexletCode
  class Error < StandardError; end

  def self.form_for(object, url: "#", **attributes)
    attributes_string = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join(" ")
    form_tag = "<form action=\"#{url}\" method=\"post\"#{attributes_string}>"

    form_builder = FormBuilder.new(object)

    form_builder.instance_eval { yield self } if block_given?

    form_builder.submit unless form_builder.submit_added

    "#{form_tag}#{form_builder.form_content}</form>"
  end
end
