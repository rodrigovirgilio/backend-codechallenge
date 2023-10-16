class Authentication < ApplicationRecord
  validates :name, :token, presence: true
end
