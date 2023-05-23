class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :phone
      t.string :description
      t.string :address
      t.boolean :gender

      t.timestamps
    end
  end
end
