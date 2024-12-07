class Api::V1::ExercisesController < Api::V1::ApplicationController
  skip_before_action :authenticate_request

  # GET /api/v1/exercises
  def index
    @exercises = Exercise.all.includes(:muscle_groups).order(:name)
    render :index
  end

  # GET /api/v1/exercises/:id
  def show
    @exercise = Exercise.find_by(id: params[:id])

    if @exercise
      render :show, status: :ok
    else
      render json: { error: 'Exercise not found' }, status: :not_found
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :description, :link, muscle_group_ids: [])
  end
end
