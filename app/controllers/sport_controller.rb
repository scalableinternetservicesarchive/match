class SportController < ApplicationController
    before_action :authenticate_user!
    def add_sport_form
    end
    def add_sport
        @sport = Sport.new()
        @sport.user_id = current_user.id
        @sport.name = params[:sport]
        if @sport.save
            flash[:notice] = "Sport successfully added!"
            redirect_to pages_home_url => 'pages#home'
        else
            render :new
        end
    end
end
