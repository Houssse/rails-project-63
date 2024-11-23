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

  def self.render_inputs(inputs)
    inputs.map(&:render).join
  end

  def self.render_submit(submit)
    options = submit[:options] || { value: 'Save' }
    Tag.build('input', type: 'submit', **options)
  end
end
