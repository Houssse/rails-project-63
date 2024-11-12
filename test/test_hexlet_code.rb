# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_build_br_tag
    result = HexletCode::Tag.build('br')
    assert_equal '<br>', result
  end

  def test_build_img
    result = HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal "<img src=\"path/to/image\">", result
  end

  def test_build_input
    result = HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal "<input type=\"submit\" value=\"Save\">", result
  end

  def test_build_label
    result = HexletCode::Tag.build('label') { 'Email' }
    assert_equal "<label>Email</label>", result
  end

  def test_build_label_options
    result = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal "<label for=\"email\">Email</label>", result
  end

  def test_build_div_tag
    result = HexletCode::Tag.build('div')
    assert_equal "<div></div>", result
  end
end
