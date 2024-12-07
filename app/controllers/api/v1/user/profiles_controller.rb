class Api::V1::User::ProfilesController < Api::V1::ApplicationController

  def show
    @user = current_user
    render json: { name: name }
  end

  def upcoming_workout
  end

  def statistics
  end
end