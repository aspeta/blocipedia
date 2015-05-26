class CollaboratorsController < ApplicationController
def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
    @collaborator = Collaborator.new
    @users = User.all
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params)
  
    if @collaborator.save
      flash[:notice] = "Collaborator was added."
    else
      flash[:error] = "There was an error saving your collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])  
    @collaborator = @wiki.collaborators.find(params[:id])
    @collaborator.destroy
    redirect_to wiki_collaborators_path(@wiki)
  end

   private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end

end
