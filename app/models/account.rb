class Account < ApplicationRecord
	has_many :subscription_accounts, dependent: :destroy
	has_many :account_clients, dependent: :destroy
	has_many :subscriptions, through: :subscription_accounts
	has_many :clients, through: :account_clients
	accepts_nested_attributes_for :account_clients, allow_destroy: true
	accepts_nested_attributes_for :subscription_accounts, allow_destroy: true
end
