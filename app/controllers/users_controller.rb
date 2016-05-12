class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    if @user
      render json: @user
    else
      @user = User.new(device_id: params[:id])

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  private

    def set_user
      @user = User.where(device_id: params[:id]).first
    end

    def user_params
      params.require(:user).permit(:device_id, :gcm_registration_id,
        :radius, :number_of_shares, :number_of_ignores, :longitude, :latitude)
    end
end
