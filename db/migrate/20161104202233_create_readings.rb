class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end
end
