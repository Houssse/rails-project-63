# frozen_string_literal: true

require_relative 'inputs'

module HexletCode
  # Class for building the form structure
  class FormBuilder
    attr_reader :form_body

    def initialize(object, **attributes)
      @object = object
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: {
          action: attributes.fetch(:url, '#'),
          method: attributes.fetch(:method, 'post')
        }.merge(attributes.except(:url, :method))
      }
    end

    def input(attribute, **options)
      value = fetch_attribute_value(attribute)
      input_class = resolve_input_class(options[:as])
      input_instance = input_class.new(attribute, value, **options.except(:as))
      @form_body[:inputs] << input_instance
    end

    def submit(value = 'Save')
      @form_body[:submit][:options] = { value: value }
    end

    private

    def fetch_attribute_value(attribute)
      @object.public_send(attribute)
    end

    def resolve_input_class(type)
      case type
      when :text
        HexletCode::Inputs::TextInput
      else
        HexletCode::Inputs::StringInput
      end
    end
  end
end
