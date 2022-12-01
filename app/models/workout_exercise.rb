class WorkoutExercise < ActiveRecord::Base
    belongs_to :exercise
    belongs_to :workout
    has_many :workout_sets
end