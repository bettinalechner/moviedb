class RolesController < ApplicationController
    def new
        @role = Role.new
        if params[:movie_id]
            @movie = Movie.find(params[:movie_id])
            render 'new_role'
        elsif params[:actor_id]
            @actor = Actor.find(params[:actor_id])
            render 'new_cast'
        else
            raise 'Actor or Movie must be defined'
        end
    end
    
    def create
        if params[:movie_id]
            @movie = Movie.find(params[:movie_id])
            
            if @movie.roles.create(role_params)
                redirect_to @movie
            else
                render 'new_role'
            end
        elsif params[:actor_id]
            @actor = Actor.find(params[:actor_id])
            
            if @actor.roles.create(role_params)
                redirect_to @actor
            else
                render 'new_cast'
            end
        else
            raise 'Actor or Movie must be defined'
        end
    end
    
    def edit
        @role = Role.find(params[:id])
        @movie = Movie.find(params[:movie_id])
    end
    
    def update
        @role = Role.find(params[:id])
        if @role.update(role_params)
            redirect_to @role.movie
        else
            render 'edit'
        end
    end
    
    def destroy
        @role = Role.find(params[:id])
        @movie = Movie.find(params[:movie_id])
        @role.destroy
        
        redirect_to @movie
    end
    
    private
    
    def role_params
        params.require(:role).permit(:movie_id, :actor_id, :name)
    end
end
