class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.integer :organizer_id
    end
  end
end
