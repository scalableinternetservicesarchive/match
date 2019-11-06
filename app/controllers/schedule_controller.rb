class ScheduleController < ApplicationController
    before_action :authenticate_user!
    def add_timeslot_form
    end
    def add_timeslot
        @timeslot = Timeslot.new()
        @timeslot.user_id = current_user.id
        @timeslot.time = params[:time]        
        @timeslot.day = params[:day]
        #TODO: Need to link to organizer - first define has many relation in game model
        if @timeslot.save
            flash[:notice] = "Timeslot successfully created"
            redirect_to pages_home_url => 'pages#home'
        else
            render :new
        end
    end
    #Remove a time slot from weekly availability
    def remove_time_slot

    end
end
