class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.string :offering_type
      t.integer :offering_id
      t.timestamps
    end
  end
end
