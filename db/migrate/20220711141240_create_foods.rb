class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string     :name, null: false
      t.date       :purchase_day, null: false
      t.date       :limit_day
      t.references :pantry, null: false, foreign_key: true
      t.timestamps
    end
  end
end
