class WikisController < ApplicationController
  def index
   # @wikis = Wiki.all
    @wikis = Wiki.visible_to(current_user)
    authorize @wikis
  end
  def create
    #@wiki = Wiki.new(params.require(:wiki).permit(:name,:description))
    #@wiki.user_id= current_user.id
    
    @wiki = current_user.wikis.build( params.require(:wiki).permit(:name,:description,:public) )
    authorize @wiki
    if @wiki.save
      flash[:success] = "Wiki was added successfully"
    else  
     flash[:error] = wiki.errors.full_messages.join("<br>").html_safe
    end
    redirect_to :action => 'index'
  end
  def new
    @wiki = Wiki.new
#    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again"
      render :edit
    end
  end

 def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "The wiki was deleted successfully"
      redirect_to wiki_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end
  def show
   @wiki = Wiki.find(params[:id])
#  authorize @wiki
  end

  def edit
   @wiki = Wiki.find(params[:id])
   authorize @wiki
  end
    private

  def wiki_params
    params.require(:wiki).permit(:description, :public)#, :user_id)
  end
end
