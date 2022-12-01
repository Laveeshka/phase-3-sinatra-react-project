class CreateWorkoutSets < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_sets do |t|
      t.integer :weight
      t.integer :reps
      t.boolean :completed
      t.integer :workout_exercise_id
    end
  end
end
