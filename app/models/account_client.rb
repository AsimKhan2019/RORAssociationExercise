class AccountClient < ApplicationRecord
  belongs_to :client
  belongs_to :account
end
