require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  let(:user) { create :user }

  describe "POST #login" do

    context "when password is valid" do
      it "sets user to current_user and redirects to root" do
        post :create, session: {email: user.email, password: user.password}

        expect(response).to redirect_to root_url
        expect(controller.current_user).to eq user
      end
    end

    context "when password is invalid" do
      it "renders the :new template" do
        post :create, session: {email: user.email, password: 'invalid'}

        expect(response).to render_template(:new)
      end
    end
  end
end