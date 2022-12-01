class RemoveTimeTakenFromWorkouts < ActiveRecord::Migration[6.1]
  def change
    remove_column :workouts, :time_taken, :datetime
  end
end
