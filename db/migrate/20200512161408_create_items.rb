class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :location
      t.string :seeking
      t.float :value

      t.timestamps
    end
  end
end
