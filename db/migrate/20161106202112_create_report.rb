class CreateReport < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.date :start_date
      t.date :end_date
      t.string :report_type

      t.integer :maximum
      t.integer :minimum
      t.integer :average

      t.integer :user_id

      t.index :start_date
      t.index :end_date
      t.index :report_type
    end
  end
end
