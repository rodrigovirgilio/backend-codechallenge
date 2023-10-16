class Api::V1::UsersController < Api::V1::ApplicationController
  include Docs::UsersControllerDoc

  api :POST, "/v1/users", "Create new user"
  param_group :user_controller_create, Docs::UsersControllerDoc
  def create
    @user = User.create(user_params)

    if @user.valid?
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :GET, "/v1/users", "List of Users"
  param_group :user_controller_index, Docs::UsersControllerDoc
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  private

  def user_params
    params.permit(:first_name, :last_name)
  end
end
