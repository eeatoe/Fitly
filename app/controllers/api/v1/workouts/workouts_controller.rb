class Api::V1::Workouts::WorkoutsController < ApplicationController
  def expert_index
    @workouts = Workout.by_expert
    render json: Oj.dump(WorkoutsSerializer.new(Workouts).serializable_hash)
  end

  def my_index
    @workouts = current_user.workouts
    render json: Oj.dump(WorkoutsSerializer.new(Workouts).serializable_hash)
  end
end