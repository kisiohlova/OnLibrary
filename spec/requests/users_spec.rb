require "rails_helper"

RSpec.describe Devise::RegistrationsController, type: :request do
  let!(:user) { create :user }
  let(:valid_attributes) { attributes_for(:user) }
  let(:without_username) { attributes_for(:user, :without_username) }
  let(:wrong_email) { attributes_for(:user, :without_username) }
  let(:short_password) { attributes_for(:user, :without_username) }

  describe "GET /users/sign_up" do
    it "is successful" do
      get new_user_registration_path

      expect(response).to be_successful
    end
  end

  describe "POST /users/sign_in" do
    it "log in with valid credentials" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to be_redirect
      expect(flash[:notice]).to eq("Signed in successfully.")
    end
  end

  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user and redirects" do
        expect do
          post user_registration_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Welcome! You have signed up successfully.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { [without_username, wrong_email, short_password] }

      it "does not create a new user" do
        invalid_attributes.each do |invalid_attribute|
          expect do
            post user_registration_path, params: { user: invalid_attribute }
          end.not_to change(User, :count)

          expect(response).to be_unprocessable
        end
      end
    end
  end

  describe "DELETE /users/sign_out" do
    it "log out" do
      sign_in user

      delete destroy_user_session_path

      expect(response).to be_redirect
      expect(flash[:notice]).to eq("Signed out successfully.")
    end
  end
end
