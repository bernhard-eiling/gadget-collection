require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user1) { create :user, email: "1@1.com" }
  let(:user2) { create :user, email: "2@2.com" }

  describe "GET#index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns all users into @users" do
      users = user1, user2
      get :index
      expect(assigns(:users)).to match_array(users)
    end

    it "success" do
      expect(response).to be_success
    end

  end
end
