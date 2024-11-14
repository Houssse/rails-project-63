# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

def form_field
  '<form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>'
end


def form_field_url
  '<form action="#" method="post"><input name="name" type="text" value="rob" class="user-input"><input name="job" type="text" value="hexlet"></form>'
end

def form_defolt_attrubute
  '<form action="#" method="post"><textarea cols="50" rows="50" name="job">hexlet</textarea></form>'
end


# =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)