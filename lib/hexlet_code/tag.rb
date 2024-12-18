# frozen_string_literal: true

module HexletCode
  # Class for building HTML tags
  class Tag
    SINGLE_TAGS = %w[input img br].freeze

    def self.build(tag_name, **options) # rubocop:disable Metrics/AbcSize
      ordered_keys = %w[name id type value class] + options.keys.map(&:to_s)
      ordered_keys.uniq!

      sorted_options = ordered_keys.filter_map { |key| [key, options[key.to_sym]] if options[key.to_sym] }.to_h
      options_string = sorted_options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      content = block_given? ? yield : ''

      if SINGLE_TAGS.include?(tag_name)
        "<#{tag_name} #{options_string}>"
      else
        "<#{tag_name} #{options_string}>#{content}</#{tag_name}>"
      end
    end
  end
end
