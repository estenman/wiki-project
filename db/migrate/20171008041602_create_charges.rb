class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :premium_paid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
