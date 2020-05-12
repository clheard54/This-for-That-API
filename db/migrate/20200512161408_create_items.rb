class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :location
      t.float :value

      t.timestamps
    end
  end
end
