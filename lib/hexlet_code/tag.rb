# frozen_string_literal: true

# Class for building HTML tags.
class Tag
  def self.build(tag_name, **options)
    options_string = options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
    content = block_given? ? yield : ""

    if %w[input br hr img meta link].include?(tag_name)
      "<#{tag_name} #{options_string}>"
    else
      "<#{tag_name} #{options_string}>#{content}</#{tag_name}>"
    end
  end
end
