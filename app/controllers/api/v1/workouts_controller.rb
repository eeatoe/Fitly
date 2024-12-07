class Api::V1::UserWorkoutsController < Api::V1::ApplicationController
  
  # GET /api/v1/workouts
  def index
    @workouts = current_user.workouts.includes(:exercises, :workout_exercises)
    render :index
  end

  # GET /api/v1/workout/:id
  def show
    @workout = current_user.workouts.includes(:exercises, :workout_exercises).find_by(id: params[:id])
    
    if @workout
      render :show, status: :ok
    else
      render json: { error: 'Workout not found' }, status: :not_found
    end
  end

end