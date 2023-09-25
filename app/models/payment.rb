class Payment < ApplicationRecord
	has_many :client_payment_subscriptions
end
