class CreateOtaCodeListCodes < ActiveRecord::Migration
  def self.up
    down
    create_table :ota_code_list_codes, {:id => false}  do |t|
      t.string  :list_code
      t.integer :code
      t.string  :name
      t.string  :domain
      t.text    :definition
      t.date    :date
    end
    execute "ALTER TABLE ota_code_list_codes ADD PRIMARY KEY(list_code, code)"
  end

  def self.down
    drop_table :ota_code_list_codes
  end
end
