class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    # Display the user's game schedule
    if current_user
      # User is signed in, so get their timeslots
      @timeslots = Timeslot.where(user_id: current_user.id)
    else
      # User is not signed in
    end 
  end
end
