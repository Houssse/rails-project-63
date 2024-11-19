# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

def form_with_default_attributes
  '<form action="#" method="post"><label for="input_name">Name</label><input name="name" type="text" value="rob"><label for="input_job">Job</label><textarea name="job">hexlet</textarea><input type="submit" value="Save"></form>' # rubocop:disable Layout/LineLength
end

def form_with_custom_textarea_attributes
  '<form action="#" method="post"><label for="input_name">Name</label><input name="name" type="text" value="rob" class="user-input"><label for="input_job">Job</label><textarea name="job" rows="50" cols="50">hexlet</textarea><input type="submit" value="Create"></form>' # rubocop:disable Layout/LineLength
end
