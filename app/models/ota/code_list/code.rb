class Ota::CodeList::Code < ActiveRecord::Base

  set_primary_keys :list_code, :code
  belongs_to :list, :class_name   => 'Ota::CodeList::List'
end
