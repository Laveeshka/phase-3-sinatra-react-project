class AddCompletedAtToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :completed_at, :datetime
  end
end
