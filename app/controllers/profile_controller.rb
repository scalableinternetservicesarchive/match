class ProfileController < ApplicationController
    #Map profile/username to username's profile page

  
  
  def show
        
        if current_user
        @user = current_user.first_name + ' ' + current_user.last_name
       # User is signed in, so get their timeslots
        @timeslots = Timeslot.where(user_id: current_user.id)
    else
      # User is not signed in
  end
  def form_submission
    redirect_to '/schedule/add'
  end
end
end