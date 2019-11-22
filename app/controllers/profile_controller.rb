class ProfileController < ApplicationController
  #Map profile/username to username's profile page
  def show
    if current_user
      @user = User.find_by(username: params[:username])
      # User is signed in, so get their timeslots
      @timeslots = Timeslot.where(user_id: @user.id)
    else
      # User is not signed in
  end

  def form_submission
    redirect_to '/schedule/add'
  end
end
end