class CreateTagsOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :tags_offerings do |t|
      t.integer :tag_id
      t.integer :offering_id
      t.string :offering_type

      t.timestamps
    end
  end
end
