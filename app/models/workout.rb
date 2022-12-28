require_all 'app'

class Workout < ActiveRecord::Base

    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises

    def self.add_workout(started_at)
        Workout.find_or_create_by(started_at: started_at)
    end

end