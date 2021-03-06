class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :share]

  api :GET, '/posts',"Get all posts"
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    render json: @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    head :no_content
  end

  # expects :id of post and :user_id
  # POST /posts/:id?:user_id
  def share
    @user = User.find(params[:user_id])
    PostsUser.where(user: @user, post: @post).first.update(action: "share")
    @post.number_of_shares += 1
    @post.save
    @post.publish_post(@user)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id, :number_of_ignores, :number_of_shares, :reply_to, :priority)
    end
end
