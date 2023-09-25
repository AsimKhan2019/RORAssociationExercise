class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.date :date
      t.decimal :price
      t.integer :validity

      t.timestamps
    end
  end
end
