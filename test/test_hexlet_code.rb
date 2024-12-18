# frozen_string_literal: true

require_relative 'test_helper'
require 'minitest/autorun'
class TestHexletCode < Minitest::Test
  def test_generates_form_with_default_attributes
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = load_fixture('default_attributes.html')

    assert_equal expected, result
  end

  def test_generates_form_with_custom_textarea_attributes
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit 'Create'
    end

    expected = load_fixture('custom_textarea_attributes.html')

    assert_equal expected, result
  end

  def test_send_not_exists_user_method
    user = User.new

    error = assert_raises(NoMethodError) do
      HexletCode.form_for(user) do |f|
        f.input :company
        f.submit 'Boom!'
      end
    end

    assert_match(/undefined method `company'/, error.message)
  end

  def test_form_with_submit
    user = User.new(name: 'rob', job: 'hexlet')
    result = HexletCode.form_for(user) do |f|
      f.submit 'Save'
    end

    expected = load_fixture('form_with_submit.html')
    assert_equal expected, result
  end

  def test_form_with_put_method
    user = User.new(name: 'rob', job: 'hexlet')
    result = HexletCode.form_for(user, method: :put) do |f|
      f.input :name
      f.submit 'Update'
    end

    expected = load_fixture('form_with_put_method.html')
    assert_equal expected, result
  end

  def test_form_with_invalid_input_attribute
    user = User.new(name: 'rob', job: 'hexlet')

    assert_silent do
      HexletCode.form_for(user) do |f|
        f.input :name, rows: 50
      end
    end
  end
end
