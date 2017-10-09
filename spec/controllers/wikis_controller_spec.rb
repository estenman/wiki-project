require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) { create(:wiki) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET show" do
    it "returns http success" do
      p "***************************"
      p my_wiki
      p "***************************"
      get :show, id: my_wiki.id
      p response
      p "***************************"
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, id: my_wiki.id
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, id: my_wiki.id
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

end
