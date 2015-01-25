class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :number
      t.string :state
      
#       the foriegn key to reference
      t.integer :driver_id

      t.timestamps null: false
    end
  end
end
