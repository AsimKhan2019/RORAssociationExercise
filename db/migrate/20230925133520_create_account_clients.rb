class CreateAccountClients < ActiveRecord::Migration[7.0]
  def change
    create_table :account_clients do |t|
      t.references :client, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
