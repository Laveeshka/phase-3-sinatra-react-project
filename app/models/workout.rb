require_all 'app'

class Workout < ActiveRecord::Base

    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises

    def self.add_workout(started_at)
        Workout.find_or_create_by(started_at: started_at)
    end

    def self.filter_workouts_by_oldest
        Workout.all.order(:completed_at)
    end

    def self.filter_workouts_by_latest
        Workout.all.order(completed_at: :desc)
    end

    ### class method below not needed since we want to limit the number of server calls ###

    # def self.all_workouts_for_summary
    #     all = Workout.all.map do |workout| 
    #         count = workout.exercises_count
    #         completed_sets = workout.get_completed_sets
    #         workout_hash = workout.to_hash
    #         #add number of exercises as key-value pair
    #         workout_hash["exercises"] = count
    #         #add number of completed sets as key-value pair
    #         workout_hash["completed_sets"] = completed_sets
    #         workout_hash
    #         #binding.pry
    #     end
    # end


    ###HELPER FUNCTIONS###
    
    # def get_exercises
    #     self.exercises
    # end

    # def exercises_count
    #     self.get_exercises.count
    # end

    # def get_completed_sets
    #     completed_sets = 0
    #     self.workout_exercises.each do |workout_exercise|
    #         completed_sets = completed_sets + workout_exercise.workout_sets.where(completed: true).count
    #     end
    #     completed_sets
    # end

end