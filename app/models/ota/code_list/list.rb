class Ota::CodeList::List < ActiveRecord::Base
  set_primary_key 'code'

  has_many :codes,  :class_name => "Ota::CodeList::Code",
                    :foreign_key => "list_code"

end


