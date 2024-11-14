# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

def form_field
  '<form action="#" method="post"><label for="input_name">Name</label><input name="name" id="input_name" type="text" value="rob"><label for="input_job">Job</label><textarea name="job" id="input_job" cols="20" rows="40">hexlet</textarea></form>' # rubocop:disable Layout/LineLength
end

def form_field_url
  '<form action="#" method="post"><input name="name" type="text" value="rob" class="user-input"><input name="job" type="text" value="hexlet"></form>' # rubocop:disable Layout/LineLength
end

def form_defolt_attrubute
  '<form action="#" method="post"><label for="input_name">Name</label><input name="name" id="input_name" type="text" value="rob" class="user-input"><label for="input_job">Job</label><textarea name="job" id="input_job" cols="50" rows="50">hexlet</textarea><input type="submit" value="Create"></form>' # rubocop:disable Layout/LineLength
end
