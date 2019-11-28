class ProfileController < ApplicationController
  #Map profile/username to username's profile page
  def show
    if current_user
        @user = User.find_by(username: params[:username])
        # User is signed in, so get their timeslots
        @timeslots = Timeslot.where(user_id: @user.id)
        accepted_game_ids = PlayerGameMapping.where(user_id:@user.id,is_organizer:false).select("game_id")
        created_game_ids = PlayerGameMapping.where(user_id:@user.id,is_organizer:true).select("game_id")
        if stale?(etag: accepted_game_ids, last_modified: accepted_game_ids.updated_at, etag: created_game_ids, last_modified: created_game_ids.updated_at)
          @accepted_games = Game.where('id IN (?)',accepted_game_ids)
          @created_games = Game.where('id IN (?)',created_game_ids)
        end
      end
    else
      # User is not signed in
  end

  def form_submission
    redirect_to '/schedule/add'
  end
end
end