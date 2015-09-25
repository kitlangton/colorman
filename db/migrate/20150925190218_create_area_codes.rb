class CreateAreaCodes < ActiveRecord::Migration
  def change
    create_table :area_codes do |t|
      t.integer :number
      t.string :state

      t.timestamps null: false
    end
  end
end
