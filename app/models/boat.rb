class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    returning_boats = Boat.limit(5)
    #returning_boats = Boat.first(5) , not working with pluck
  end

   def self.dinghy
     dinghies = Boat.where('length < 20')
   end

   def self.ship
     ships = Boat.where('length >= 20')
   end

   def self.last_three_alphabetically
     boats_last_three = Boat.order(name: :desc).limit(3)
     # last(3) not working with pluck.
   end

   def self.without_a_captain
     boat_without_cap = Boat.where(captain_id: nil)
     #binding.pry
   end

   def self.sailboats

     all_sailboats = Boat.includes(:classifications).where(classifications: {name: 'Sailboat'})

   end

   def self.with_three_classifications
     #binding.pry
     # b2 = Boat.includes(:classifications).group(:boat_id).having("COUNT(*) = 3")

     # joins(:classifications).group("boats.id").having("COUNT(*) = 3").select("boats.*")
   #binding.pry
     b3 = Boat.joins(:classifications).group(:boat_id).having("COUNT(*) = 3")
#binding.pry
   end

   

end #end of class
