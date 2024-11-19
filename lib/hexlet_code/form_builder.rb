# frozen_string_literal: true

# Class for building HTML forms.
class FormBuilder
  def initialize(object, **attributes)
    @object = object
    @form_body = {
      inputs: [],
      submit: { options: nil },
      form_options: {
        action: attributes.fetch(:url, "#"),
        method: attributes.fetch(:method, "post")
      }.merge(attributes.except(:url, :method))
    }
  end

  def input(attribute, **options)
    value = fetch_attribute_value(attribute)
    @form_body[:inputs] << {
      name: attribute,
      type: options[:as] == :text ? "textarea" : "text",
      value: value,
      options: options.except(:as)
    }
  end

  def submit(value: "Save")
    @form_body[:submit][:options] = { value: value }
  end

  attr_reader :form_body

  private

  def fetch_attribute_value(attribute)
    @object.public_send(attribute)
  rescue NoMethodError
    raise HexletCode::Error, "undefined method `#{attribute}' for #<struct User id=nil, name=nil, job=nil>"
  end
end
