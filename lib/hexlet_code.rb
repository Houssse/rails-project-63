# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_renderer'

autoload(:Inputs, 'hexlet_code/inputs.rb')

# The HexletCode module provides tools for building HTML forms and tags.
module HexletCode
  class Error < StandardError; end

  def self.form_for(object, options = {})
    builder = FormBuilder.new(object, **options)
    yield(builder) if block_given?
    FormRenderer.render_html(builder)
  end
end
