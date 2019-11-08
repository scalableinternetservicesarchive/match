class ProfileController < ApplicationController
    #Map profile/username to username's profile page
    def show
        @user = User.find_by!(username: params[:username])
    end
end
