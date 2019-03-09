class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    operators = Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    sailboat_captains = Captain.includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end


  def self.motorboat_operators
    motorboat_captains = Captain.includes(boats: :classifications).where(classifications: {name: "Motorboats"})
  end

  def self.talented_seafarers
    #binding.pry
    #Captain.where(self.sailors & self.motorboat_operators).all
    Captain.where(id: [Captain.sailors.pluck(:id), Captain.motorboat_operators.pluck(:id)])
  end


end #end of class
