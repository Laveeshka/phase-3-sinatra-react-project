# Delete any existing rows from the Workout and Exercise tables
# so we can run the seed file multiple times without having duplicate entries in the database
puts "🛑 Deleting Workout and Exercise data..."
Workout.destroy_all
Exercise.destroy_all

# Seed your database here
puts "🌱 Start seeding"
puts "Creating workouts..."
workout_1 = Workout.create(started_at: Time.new, completed_at: Time.new + (60*10))
workout_2 = Workout.create(started_at: Time.new, completed_at: Time.new + (60*60))
workout_3 = Workout.create(started_at: Time.new, completed_at: Time.new + (60*15))
workout_4 = Workout.create(started_at: Time.new, completed_at: Time.new + (1.5 * 60 * 60))


puts "Creating exercises..."
lateral_pulldown = Exercise.create(name: "Lateral pulldown", area: "Back")
chest_fly = Exercise.create(name: "Chest fly", area: "Chest")
tricep_pushdown = Exercise.create(name: "Tricep pushdown", area: "Triceps")
tricep_extension = Exercise.create(name: "Tricep extension", area: "Triceps")

puts "Creating workout_exercises..."
workout_exercise_1 = WorkoutExercise.create(workout: workout_1, exercise: lateral_pulldown)
workout_exercise_2 = WorkoutExercise.create(workout: workout_1, exercise: chest_fly)
workout_exercise_3 = WorkoutExercise.create(workout: workout_2, exercise: chest_fly)
workout_exercise_4 = WorkoutExercise.create(workout: workout_2, exercise: tricep_extension)
workout_exercise_5 = WorkoutExercise.create(workout: workout_2, exercise: tricep_pushdown)
workout_exercise_6 = WorkoutExercise.create(workout: workout_3, exercise: lateral_pulldown)
workout_exercise_7 = WorkoutExercise.create(workout: workout_4, exercise: chest_fly)
workout_exercise_8 = WorkoutExercise.create(workout: workout_4, exercise: lateral_pulldown)
workout_exercise_9 = WorkoutExercise.create(workout: workout_4, exercise: tricep_extension)
workout_exercise_10 = WorkoutExercise.create(workout: workout_4, exercise: tricep_pushdown)

puts "Creating workout_sets..."
workout_set_1 = WorkoutSet.create(workout_exercise: workout_exercise_1, weight: 24, reps: 12, completed: true)
workout_set_2 = WorkoutSet.create(workout_exercise: workout_exercise_1, weight: 24, reps: 12, completed: true)
workout_set_3 = WorkoutSet.create(workout_exercise: workout_exercise_1, weight: 24, reps: 12, completed: false)

puts "✅ Done seeding!"
