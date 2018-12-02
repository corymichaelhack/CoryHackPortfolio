module CurrentUserConcern
  extend ActiveSupport::Concern
#Devise gem method current_user
#Use super to grab the same method from devise or create guest user from OpenStruct 
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guestuser@email.com"
    guest
  end
end