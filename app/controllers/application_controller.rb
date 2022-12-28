
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  ### GET routes ###

  get "/workouts" do 
    workouts = Workout.all
    workouts.to_json(include: { workout_exercises: { include: :workout_sets } })
  end

  get "/workouts/:id" do
    workout = Workout.find(params[:id])
    workout.to_json(include: { workout_exercises: { include: :workout_sets } })
  end

  get "/exercises" do
    if params[:area]
      exercises = Exercise.filter_by_area(params[:area])
    else
      exercises = Exercise.all
    end
    exercises.to_json
  end

  #get "/exercises/:area"

  get "/exercises/:id" do
    exercise = Exercise.find(params[:id])
    exercise.to_json
  end

  get "/workout_exercises" do
    workout_exercises = WorkoutExercise.all
    workout_exercises.to_json(include: :workout_sets)
  end

  get "/workout_sets" do
    workout_sets = WorkoutSet.all
    workout_sets.to_json
  end

  ### POST routes ###

  post "/workouts" do
    new_workout = Workout.add_workout(params[:started_at])
    new_workout.to_json
  end

  post "/exercises" do
    new_exercise = Exercise.add_exercise(
      params[:name], params[:area]
    )
    new_exercise.to_json
  end

  post "/workout_exercises" do
    new_workout_exercise = WorkoutExercise.add_workout_exercise(
      params[:workout_id], params[:exercise_id]
    )
    new_workout_exercise.to_json
  end

  post "/workout_sets" do
    exercise_set = WorkoutSet.create(workout_exercise_id: params[:workout_exercise_id], weight: params[:weight], reps: params[:reps], completed: params[:completed])
    exercise_set.to_json
  end

  ### PATCH routes ###
  
  patch "/workouts/:id" do
    workout = Workout.find(params[:id])
    workout.update(params)
    workout.to_json(include: { workout_exercises: { include: :workout_sets } })
  end

  patch "/workout_sets/:id" do
    workout_set = WorkoutSet.find(params[:id])
    workout_set.update(params)
    workout_set.to_json
  end

  ### DELETE routes ###

  delete "/workouts/:id" do
    deleted_workout = Workout.find(params[:id])
    deleted_workout.destroy
    deleted_workout.to_json
  end

  delete "/workout_exercises/:id" do
    deleted_workout_exercise = WorkoutExercise.find(params[:id])
    deleted_workout_exercise.workout_sets.destroy_all
    deleted_workout_exercise.destroy
    deleted_workout_exercise.to_json
  end

  delete "/workout_sets/:id" do
    deleted_workout_set = WorkoutSet.find(params[:id])
    deleted_workout_set.destroy
    deleted_workout_set.to_json
  end

end
