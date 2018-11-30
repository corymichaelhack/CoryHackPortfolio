module CurrentUserConcern
  extend ActiveSupport::Concern
#Devise gem method current_user
#Use super to grab the same method from devise or create guest user from OpenStruct 
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User", 
                  first_name: "Guest", 
                  last_name: "User", 
                  email: "guest@user.com")
  end
end