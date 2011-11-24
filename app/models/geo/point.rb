class Geo::Point
  include Mongoid::Document

  field :key, type: String
  field :lat, type: Float
  field :lng, type: Float
  field :csq, type: String
  index :csq 
  index :key, unique: true 
  validates_numericality_of :lat
  validates_numericality_of :lng
  validates_presence_of :key  


  before_save :round_coords, :set_csquare

  def self.find_all_by_key(string)
    all(conditions: {:key => regexp(string) })
  end
  def self.find_by_key(string)
    key = string =~ /\*/ ? regexp(string) : string
    first(conditions: {:key => string })
  end
  def self.find_all_by_csq(csq, key=nil)
    key ? all(conditions: {:csq => regexp("#{csq}*"), :key => regexp(key)}) : all(conditions: {:csq => regexp("#{csq}*")})
  end 
  def self.regexp(string)
    /^#{string.gsub(/\*/,'.*')}$/
  end
  def csq_code(km=1)
    CSquare.new(lat, lng).sq(CSquare::KM[km.to_i])
  end


  def self.bootstrap!(n=nil)
    return Geo::Point.delete_all if !n
    return if Geo::Point.count > 500000
    path = Rails.root.join("data", "csv", "geo", "uk", "postcodes")
    Dir.entries(path).each do |f|
      next if f =~ /^\./
      next unless f == n
      CSV.foreach("#{path}/#{f}") do |c|
        o = Geo::Point.new
        o.lat, o.lng = c[2].to_f, c[3].to_f
        o.key = ['GBR', 'ZIP', c.first.upcase.gsub(/\s/){}].join(':')
        o.save
      end
    end
  end

  private

  def round_coords
    self.lat, self.lng = lat.round(3), lng.round(3)
  end
  def set_csquare
    self.csq = CSquare.new(lat, lng).code
    #self.c1, self.c5, self.c10, self.c50, self.c100, self.c1000 = c.sq(0.01, 1), c.sq(0.05, 1), c.sq(0.1, 1), c.sq(0.5, 1), c.sq(1, 1), c.sq(5, 1), c.sq(10, 1)
  end
end
