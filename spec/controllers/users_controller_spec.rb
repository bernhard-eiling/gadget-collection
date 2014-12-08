require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user1) { create :user, email: "1@1.com" }
  let(:user2) { create :user, email: "2@2.com" }

  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns all users into @users" do
      users = user1, user2
      get :index
      expect(assigns(:users)).to match_array users
    end

    it "success" do
      expect(response).to be_success
    end
  end

  describe "GET #show" do

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: user1
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns user to @user" do
      get :show, id: user1
      expect(assigns :user).to match user1
    end

    it "renders the :show template" do
      get :show, id: user1
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns a new User to @user" do
      get :new
      expect(assigns :user).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #create" do

    context "with valid attributes" do

      it "saves a new user" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by 1
      end

      it "redirects to the created user" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to User.last
      end
    end

    context "with invalid attributes" do

      it "failes at saving a new user" do
        expect{
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "renders the :new template" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end
end
