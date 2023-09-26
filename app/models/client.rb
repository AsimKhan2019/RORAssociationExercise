class Client < ApplicationRecord
	has_many :account_clients
	has_many :accounts, through: :account_clients
end
