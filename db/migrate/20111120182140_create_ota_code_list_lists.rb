class CreateOtaCodeListLists < ActiveRecord::Migration
  def self.up
    down
    create_table :ota_code_list_lists, {:id => false} do |t|
      t.string  :code
      t.string  :name
      t.date    :date
    end
    execute "ALTER TABLE ota_code_list_lists ADD PRIMARY KEY(code)"
  end

  def self.down
    drop_table :ota_code_list_lists
  end
end
