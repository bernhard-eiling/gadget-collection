require 'rails_helper'

RSpec.describe GadgetsController, :type => :controller do

  let(:user) { create :user }
  let(:gadget1) { create :gadget, user_id: user.id}
  let(:gadget2) { create :gadget, user_id: user.id}

  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index, user_id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, user_id: user
      expect(response).to render_template :index
    end

    it "assigns all gadgets into @gadgets" do
      gadgets = gadget1, gadget2
      get :index, user_id: user
      expect(assigns(:gadgets)).to match_array(gadgets)
    end

    it "success" do
      expect(response).to be_success
    end
  end

  describe "GET #show" do

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: gadget1, user_id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns gadget1 to @gadget" do
      get :show, id: gadget1, user_id: user
      expect(assigns :gadget).to match gadget1
    end

    it "renders the :show template" do
      get :show, id: gadget1, user_id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do

    it "responds successfully with an HTTP 200 status code" do
      get :new, user_id: user
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns a new Gadget to @gadget" do
      get :new, user_id: user
      expect(assigns :gadget).to be_a_new Gadget
    end

    it "renders the :new template" do
      get :new, user_id: user
      expect(response).to render_template :new
    end
  end

  describe "GET #create" do

    context "with valid attributes" do
      it "saves a new gadget" do
        expect{
          post :create, gadget: attributes_for(:gadget), user_id: user
        }.to change(Gadget, :count).by 1
      end

      it "redirects to the created gadget" do
        post :create, gadget: attributes_for(:gadget), user_id: user
        expect(response).to redirect_to user_gadget_path(user, Gadget.last)
      end
    end

    context "with invalid attributes" do
      it "failes at saving a new gadget" do
        expect{
          post :create, gadget: attributes_for(:invalid_gadget), user_id: user
        }.to_not change(Gadget, :count)
      end

      it "renders the :new template" do
        post :create, gadget: attributes_for(:invalid_gadget), user_id: user
        expect(response).to render_template :new
      end
    end
  end
end
