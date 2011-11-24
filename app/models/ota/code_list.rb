module Ota::CodeList
  def self.table_name_prefix
    'ota_code_list_'
  end
  def self.bootstrap!
    Ota::CodeList::List.delete_all
    Ota::CodeList::Code.delete_all
    domains = ['COMMON', 'HOTEL', 'DYNAMIC PACKAGING', 'VEHICLE', 'INSURANCE', 'AIR', 'CRUISE', 'RAIL']
    path = Rails.root.join("lib", "csv", "OpenTravel_CodeList_2010_12_2.csv")
    type = nil
    CSV.foreach(path, :headers => :first_row) do |c|
      t = [c['CODE LIST NAME'], c['CODE NAME']]
      if t.first
        type = t
        o = Ota::CodeList::List.new
        o.name, o.code, o.date = t.first, t.last, c['DATE']
        o.save
      else
        o = Ota::CodeList::Code.new
        o.list_code, o.name, o.code, o.definition, o.date = type.last, c['CODE NAME'], c['CODE VALUE'], c['DEFINITION'], c['DATE']
        o.domain = domains.select {|it| c[it] }.first
        o.save
      end
    end
  end
end
