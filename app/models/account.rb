class Account < ApplicationRecord
	has_many :subscription_accounts
	has_many :account_clients
	has_many :subscriptions, through: :subscription_accounts
end
