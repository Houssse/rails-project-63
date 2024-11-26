# frozen_string_literal: true

module HexletCode
  module Inputs
    # Input for string data
    class StringInput < BaseInput
      TAG_NAME = 'input'

      def render
        render_label +
          Tag.build(TAG_NAME, type: 'text', name: name, value: value, **options)
      end
    end
  end
end
