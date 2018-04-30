class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.float :age
      t.string :gender
      t.boolean :trained
      t.integer :fee
      t.text :description

      t.integer :breed_id
      t.integer :user_id

      t.timestamps
    end
  end
end
