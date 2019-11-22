class MatchController < ApplicationController
    before_action :authenticate_user!
    def new_post_form
    end
    def new_post
        @game = Game.new()
        @game.status = Game.STATUS_PROPOSED
        @game.interest = params[:interest]
        @game.venue = params[:venue]
        @game.date = params[:date]
        @game.start_time = params[:start_time]
        @game.end_time = params[:end_time]
        @game.description = params[:description]
        #TODO: Need to link to organizer - first define has many relation in game model
        if @game.save
            redirect_to '/', notice: "Post successfully created"
        else
            render :new
        end
    end
    def search_games
        if params[:interest]
            @games = Game.where('interest LIKE ?', "%#{params[:interest]}%")
        else
            @games = Game.all 
        end
    end
    def search_user
        if params[:interest]
            @users = User.where('username LIKE ?',"%#{params[:interest]}%")
        else
            @users = User.all
        end
    end 
    def challenge
    end
end
