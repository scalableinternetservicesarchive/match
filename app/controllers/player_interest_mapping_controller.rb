class PlayerInterestMappingController < ApplicationController
    before_action :authenticate_user!
    def add_player_interest_mapping_form
    end
    def add_player_interest_mapping
        table = "window.location = " + "/" + "profile" + current_user.username
        @player_interest_mapping = playerinterestmapping.new()
        @player_interest_mapping.user_id = current_user.id
        @player_interest_mapping.name = params[:playerinterestmapping]
        if @player_interest_mapping.save
            flash[:notice] = "Successfully added new interest"
            render: js => table
        
        else
            render :new
        end
    end
end
