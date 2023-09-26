class Subscription < ApplicationRecord
	has_many :client_payment_subscriptions
	has_many :account_clients, through: :client_payment_subscriptions
	has_many :subscription_accounts
	has_many :accounts, through: :subscription_accounts
end
