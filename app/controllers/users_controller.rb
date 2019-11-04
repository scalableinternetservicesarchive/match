class UsersController < ApplicationController
    before_action :authenticate_user!
    #Map users/username to username's profile page
    def show
        @user = User.find_by!(username: params[:id])
    end
end
