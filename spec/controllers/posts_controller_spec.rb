require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  let!(:post_obj) {FactoryGirl.create(:post)}

  let(:valid_attributes) {
    FactoryGirl.build(:post).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {
      number_of_shares: 1
    }
  }


  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index, {}
      expect(assigns(:posts)).to eq([post_obj])
    end
  end
  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, {:id => post_obj.to_param}
      expect(assigns(:post)).to eq(post_obj)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {:post => invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
           number_of_shares: 5
        }
      }

      it "updates the requested post" do
        put :update, {:id => post_obj.to_param, :post => new_attributes}
        post_obj.reload
        expect(post_obj.number_of_shares).to eq(5)
      end

      it "assigns the requested post as @post" do
        put :update, {:id => post_obj.to_param, :post => valid_attributes}
        expect(assigns(:post)).to eq(post_obj)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        put :update, {:id => post_obj.to_param, :post => invalid_attributes}
        expect(assigns(:post)).to eq(post_obj)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      expect {
        delete :destroy, {:id => post_obj.to_param}
      }.to change(Post, :count).by(-1)
    end
  end

end
