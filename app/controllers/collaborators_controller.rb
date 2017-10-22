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
end
