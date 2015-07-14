class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end
    
    def new
        @actor = Actor.new
    end
    
    def create
        @actor = Actor.new(actor_params)
       
        if @actor.save
           redirect_to @actor
        else
           render 'new'
        end
    end
    
    private
    
    def actor_params
        params.require(:actor).permit(:first_name, :last_name, :nationality, :date_of_birth) 
    end
end
