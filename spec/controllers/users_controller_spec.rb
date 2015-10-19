require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let!(:user) {FactoryGirl.create(:user)}

  let(:valid_attributes) {
    {
      gcm_registration_id: 1,
      device_id: 1,
      number_of_shares: 1,
      number_of_ignores: 1,
      radius: 1.5,
      longitude: 31.208853,
      latitude: 30.013056
    }
  }

  let(:invalid_attributes) {
    {
      number_of_shares: 1,
      number_of_ignores: 1,
      radius: 1.5
    }
  }

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          radius: 2.5
        }
      }

      it "updates the requested user" do
        put :update, {:id => user.to_param, :user => new_attributes}
        user.reload
        expect(user.radius).to eq(2.5)
      end

      it "assigns the requested user as @user" do
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(assigns(:user)).to eq(user)
      end

    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, {:id => user.to_param, :user => invalid_attributes}
        expect(assigns(:user)).to eq(user)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end
  end

end
