class CreatePhysicals < ActiveRecord::Migration
  def change
    create_table :physicals do |t|
      t.integer :user_id, null: false, default: 0
      t.float :height, null: false, default: 0.0
      t.float :weight, null: false, default: 0.0
      t.integer :sdp, null: false, default: 0
      t.integer :dbp, null: false, default: 0
      t.integer :pulse, null: false, default: 0
      t.float :bmi, null: false, default: 0.0
      t.date :measurement_date, null: false

      t.timestamps null: false
    end
  end
end
