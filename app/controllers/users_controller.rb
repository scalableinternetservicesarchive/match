class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find_by!(username: params[:id])
    end
end
