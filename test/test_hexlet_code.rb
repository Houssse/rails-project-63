# frozen_string_literal: true

require_relative 'test_helper'
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

  def test_error_for_missing_attribute
    user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

    error_message = assert_raises(HexletCode::Error) do
      HexletCode.form_for(user, url: '/users') do |f|
        f.input :age
      end
    end

    expected_message = 'undefined method `age` for #<struct User id=nil, name=nil, job=nil>'
    assert_equal expected_message, error_message.message
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
