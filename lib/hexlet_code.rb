# frozen_string_literal: true

require_relative 'hexlet_code/version'

# The HexletCode module provides tools for building HTML forms and tags.
module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:FormRenderer, 'hexlet_code/form_renderer')
  autoload(:Inputs, 'hexlet_code/inputs.rb')

  class Error < StandardError; end

  def self.form_for(object, options = {})
    builder = HexletCode::FormBuilder.new(object, **options)
    yield(builder) if block_given?
    FormRenderer.render_html(builder)
  end
end
