class CreateSubscriptionAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_accounts do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
