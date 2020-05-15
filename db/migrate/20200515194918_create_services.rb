class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.string :location
      t.float :value
      t.string :seeking

      t.timestamps
    end
  end
end
