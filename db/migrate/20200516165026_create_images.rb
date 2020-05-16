class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :offering_id
      t.string :offering_type

      t.timestamps
    end
  end
end
