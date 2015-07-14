class RolesController < ApplicationController
    def new
        @role = Role.new
        @movie = Movie.find(params[:movie_id])
        render 'new_role'
    end
    
    def create
        @movie = Movie.find(params[:movie_id])
        
        if @movie.roles.create(role_params)
            redirect_to @movie
        else
            render 'new_role'
        end
    end
    
    private
    
    def role_params
        params.require(:role).permit(:movie_id, :actor_id, :name)
    end
end
