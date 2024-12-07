class Api::V1::User::UsersController < Api::V1::ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]

  # DELETE api/v1/users/:id
  def destroy
    user = User.find_by(id: params[:id])

    if user.nil?
      render json: { errors: 'User not found.' }, status: :not_found
      return
    end
  

    if user && user.authenticate(params[:user][:password])
      user.destroy
      render json: { message: 'User deleted successfully.' }, status: :ok
    else
      render json: { errors: 'Invalid email or password.' }, status: :unauthorized
    end
  end

  def me
    @user = current_user
    render :me # Добавь представление
  end

  # GET api/v1/users/:id
  def show
    @user = User.find_by(id: params[:id])

    if @user
      render :show, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # PATCH /api/v1/users/:id
  def update
    if @user.update(user_params)
      render json: { message: 'User updated successfully', user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
