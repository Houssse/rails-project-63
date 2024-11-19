# frozen_string_literal: true

require_relative 'tag'

# Class responsible for rendering HTML forms.
class FormRenderer
  def self.render_html(builder)
    form_body = builder.form_body
    form_options = form_body[:form_options]
    inputs_html = render_inputs(form_body[:inputs])
    submit_html = render_submit(form_body[:submit])

    Tag.build('form', **form_options) do
      inputs_html + submit_html
    end
  end

  def self.render_inputs(inputs) # rubocop:disable Metrics/AbcSize
    inputs.map do |input|
      options = input[:options].merge(name: input[:name])
      if input[:type] == 'textarea'
        Tag.build('label', for: "input_#{input[:name]}") { input[:name].capitalize } +
          Tag.build('textarea', **options) { input[:value] }
      else
        Tag.build('label', for: "input_#{input[:name]}") { input[:name].capitalize } +
          Tag.build('input', type: 'text', value: input[:value], **options)
      end
    end.join
  end

  def self.render_submit(submit)
    options = submit[:options] || { value: 'Save' }
    Tag.build('input', type: 'submit', **options)
  end
end
