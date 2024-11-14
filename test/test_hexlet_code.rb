# frozen_string_literal: true

require_relative "test_helper"
require_relative "test_date"
class TestHexletCode < Minitest::Test
  def test_generate_input_and_textarea_fields
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = form_field

    assert_equal expected, result
  end

  def test_generate_textarea_with_attributes
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result = HexletCode.form_for user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job, as: :text, rows: 50, cols: 50
      f.submit
    end

    expected = form_defolt_attrubute

    assert_equal expected, result
  end

  def test_error_for_missing_attribute
    user = User.new name: "rob", job: "hexlet", gender: "m"

    begin
      HexletCode.form_for(user, url: "/users") do |f|
        f.input :age
      end
    rescue HexletCode::Error => e
      error_message = e.message
    end

    expected_message = "undefined method `age' for #<struct User id=nil, name=nil, job=nil>"
    assert_equal expected_message, error_message
  end
end
