class ScheduleController < ApplicationController
    before_action :authenticate_user!
    
    def add_timeslot_form
        puts "Timeslot form created"
    end
    
    def add_timeslot
        @empty_responses = []
        @timeslot = Timeslot.using(:users_db).new()
        @timeslot.user_id = current_user.id
        @timeslot.time = params[:time]        
        @timeslot.day = params[:day]

        #TODO: Need to link to organizer - first define has many relation in game model
        if @timeslot.save
            puts "Timeslot saved"        
            flash[:notice] = "Timeslot successfully created!"           
            render :js => "window.location = '/profile/#{current_user.username}'"
        else
            redirect_to 'add'
        end
    end
    
    #Remove a time slot from weekly availability
    def remove_time_slot

    end
end
