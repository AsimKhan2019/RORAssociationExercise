class ClientPaymentSubscription < ApplicationRecord
  belongs_to :client
  belongs_to :payment
  belongs_to :subscription
end
