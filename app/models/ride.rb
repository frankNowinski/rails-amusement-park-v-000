class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets && tall_enough
      start_ride
    elsif !enough_tickets && tall_enough
      "Sorry. " + ticket_error
    elsif enough_tickets && !tall_enough
      "Sorry. " + height_error
    else
      "Sorry. " + ticket_error + " " + height_error
    end
  end

  def start_ride
    new_tickets = user.tickets - attraction.tickets
    new_mood = user.happiness + attraction.happiness_rating
    new_nausea = user.nausea + attraction.nausea_rating

    user.update(tickets: new_tickets, happiness: new_mood, nausea: new_nausea)
    "Thanks for riding the #{attraction.name}!"
  end

  def enough_tickets
    user.tickets >= attraction.tickets
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def ticket_error
    "You do not have enough tickets the #{attraction.name}."
  end

  def height_error
    "You are not tall enough to ride the #{attraction.name}."
  end
end
