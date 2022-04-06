class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, limit: 100, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.text :memo
      t.string :color

      t.timestamps
    end
  end
end
