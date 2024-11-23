# frozen_string_literal: true

require_relative 'base_input'

module HexletCode
  module Inputs
    # Input for text data (textarea)
    class TextInput < BaseInput
      TAG_NAME = 'textarea'

      def render
        attributes = options.dup
        attributes[:rows] ||= 5 if options.key?(:rows)
        attributes[:cols] ||= 40 if options.key?(:cols)
        render_label +
          Tag.build(TAG_NAME, name: name, **attributes) { value }
      end
    end
  end
end
