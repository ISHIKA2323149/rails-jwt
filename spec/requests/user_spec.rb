require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }
  let(:invalid_attributes) { { name: nil } }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: valid_attributes
        }
      end
    end
  end

  describe "POST #create" do
    context "with invalid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: invalid_attributes
        }
      end
    end
  end

  describe "PATCH#update" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          patch :update, params: valid_attributes
        }
      end
    end
  end

  describe "POST #login" do
    context "with valid credentials" do
      it "logs in the user and returns authentication token" do
        user = FactoryBot.create(:user)
        post :login, params: { email: user.email, password: user.password }
      end
    end

    context "with invalid credentials" do
      it "returns unauthorized" do
        post :login, params: { email: "invalid@example.com", password: "wrong_password" }
      end
    end
  end

  describe "PATCH#update" do
    context "with valid attributes" do
      let(:user) { FactoryBot.create(:user) }
      it "updates the user's name with authentication" do
      token = JsonWebToken.encode(user: user)
      request.headers['Authorization'] = "Bearer #{token}"
      expect {
      patch :update, params: valid_attributes
      }
      expect(response).to have_http_status(:ok)
      user.reload
      expect(user.name)
      end
    end
  end
end

