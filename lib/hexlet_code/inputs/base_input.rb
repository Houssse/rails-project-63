# frozen_string_literal: true

module HexletCode
  module Inputs
    # Base class for all inputs
    class BaseInput
      attr_reader :name, :value, :options

      def initialize(name, value, **options)
        @name = name
        @value = value
        @options = options
      end

      def render_label
        Tag.build('label', for: "input_#{name}") { name.capitalize }
      end
    end
  end
end
