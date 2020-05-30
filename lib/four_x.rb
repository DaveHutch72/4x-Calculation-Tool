class FourX
  attr_accessor :currency, :xchange, :date

  @@all = []
  
  def initialize(currency)
    @currency = currency
    @@all << self
  end

  def self.all
    @@all
  end


end

