class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new
    @collaborator.user_id = params[:user][:id]
    @collaborator.wiki_id = params[:wiki][:id]
  end
end
