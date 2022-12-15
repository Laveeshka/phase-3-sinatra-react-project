class WorkoutExercise < ActiveRecord::Base
    belongs_to :exercise
    belongs_to :workout
    has_many :workout_sets

    def self.add_workout_exercise(workout_id, exercise_id)
        WorkoutExercise.find_or_create_by(workout_id: workout_id, exercise_id: exercise_id)
    end

    # def add_workout_set
    #     new_workout_set = WorkoutSet.create(weight: 0, reps: 10, completed: false, workout_exercise: self)
    # end

end