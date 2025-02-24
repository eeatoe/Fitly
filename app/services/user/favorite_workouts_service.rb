class User::FavoriteWorkoutsService
  def initialize(user, workout)
    @user = user
    @workout = workout
  end

  def add_to_favorites
    user_workout = @user.user_workouts.find_or_initialize_by(workout: @workout)
    return ResultService.failure(I18n.t('workout.errors.favorite_workouts.already_added')) if user_workout.favorite?

    user_workout.is_favorite = true

    if favorite_workout.save
      ResultService.success(user_workout)
    else
      ResultService.failure(user_workout.errors.full_messages)
    end
  end

  def remove_from_favorites
    user_workout = @user.user_workouts.find_by(workout: @workout, is_favorite: true)
    return ResultService.failure(I18n.t('workout.errors.favorite_workouts.not_in_favorites')) if user_workout.nil?
  
    if user_workout.update(is_favorite: false)
      ResultService.success(user_workout)
    else
      ResultService.failure(user_workout.errors.full_messages)
    end
  end
end
