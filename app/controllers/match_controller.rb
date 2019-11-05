class MatchController < ApplicationController
    def new_post_form
    end
    def new_post
        @game = Game.new()
        @game.interest = params[:interest]
        @game.venue = params[:venue]
        @game.date = params[:date]
        @game.start_time = params[:start_time]
        @game.end_time = params[:end_time]
        @game.description = params[:description]
        #TODO: Need to link to organizer - first define has many relation in game model
        if @game.save
            redirect_to pages_home_url => 'pages#home', notice: "Post successfully created" and return
        else
            render :new
        end
    end
    def search
    end 
    def challenge
    end
end
