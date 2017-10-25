class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new

    @wiki = Wiki.find(params[:wiki])

    @collaborator.user_id = params[:user]
    @collaborator.wiki_id = @wiki.id

    if @collaborator.save
      flash[:notice] = "Collaborator was saved"
      redirect_to @wiki
    else
      flash.now[:notice] = "There was an error saving the collaborator. Please try again"
      #render "wikis/#{@wiki.id}/edit"
      render "wikis/new"
    end
  end

  def destroy
    @collaborator = Collaborator.find_by user_id: params[:user], wiki_id: params[:wiki]
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "Collaborator was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the collaborator."
      render "wikis/new"
    end
  end
end
