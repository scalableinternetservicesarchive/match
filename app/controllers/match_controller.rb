class MatchController < ApplicationController
    before_action :authenticate_user!
    protect_from_forgery except: :accept_challenge
    def new_post_form
    end
    def new_post
        if current_user
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
                flash[:notice] = "Successfully added new match!"
                @player_game_mapping = PlayerGameMapping.new()
                @player_game_mapping.user_id = current_user.id
                @player_game_mapping.game_id = @game.id
                @player_game_mapping.is_organizer = true
                @player_game_mapping.save
                render :js => "window.location = '/profile/#{current_user.username}'"
            else
                render :new
            end
        end
    end
    def search_games
        if current_user
            if params[:interest]
                @games = Game.where('interest LIKE ?', "%#{params[:interest]}%").paginate(:page => params[:page], :per_page => 24)
            else
                @games = Game.all.paginate(:page => params[:page], :per_page => 24)
            end
        end
    end
    def search_user
        if current_user
            if params[:interest]
                userids = PlayerInterestMapping.where("interest = ?", "#{params[:interest]}").select("user_id")
                @users = User.where('username LIKE ? OR id IN (?)',"%#{params[:interest]}%", userids).paginate(:page => params[:page], :per_page => 24)
            else
                @users = User.all.paginate(:page => params[:page], :per_page => 24)
            end
        end
    end 
    def accept_challenge
        if current_user
            @player_game_mapping = PlayerGameMapping.new()
            @player_game_mapping.user_id = current_user.id
            @player_game_mapping.game_id = params[:id]
            @player_game_mapping.is_organizer = false
            @player_game_mapping.save
            redirect_to '/pages/home'
        else
            render :new
        end
       
    end
end
