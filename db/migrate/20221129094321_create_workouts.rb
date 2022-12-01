class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.datetime :completed_at
      t.datetime :time_taken
      t.timestamps
    end
  end
end
