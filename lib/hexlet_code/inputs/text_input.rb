# frozen_string_literal: true

module HexletCode
  module Inputs
    # Input for text data (textarea)
    class TextInput < BaseInput
      TAG_NAME = 'textarea'
      DEFAULT_ROWS = 5
      DEFAULT_COLS = 40

      def render
        attributes = options.dup
        attributes[:rows] ||= DEFAULT_ROWS if options.key?(:rows)
        attributes[:cols] ||= DEFAULT_COLS if options.key?(:cols)
        render_label +
          Tag.build(TAG_NAME, name: name, **attributes) { value }
      end
    end
  end
end
