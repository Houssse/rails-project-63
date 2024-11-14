# frozen_string_literal: true

require_relative "test_helper"
require_relative "test_date"
class TestHexletCode < Minitest::Test

  def test_form_field
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = form_field

    assert_equal expected, result
  end

  def test_form_field_attrubute
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    expected = form_field_url

    assert_equal expected, result
  end

  def test_form_defolt_attrubute
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    result = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected = form_defolt_attrubute

    assert_equal expected, result
  end

  def test_erro_attribute
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    begin
      HexletCode.form_for(user, url: '/users') do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    rescue HexletCode::Error => e
      error_message = e.message
    end

    expected_message = "undefined method `age' for #<struct User id=nil, name=nil, job=nil>"
    assert_equal expected_message, error_message
  end
end
