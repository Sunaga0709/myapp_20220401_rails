class User < ApplicationRecord
  has_many :events  # user(1) 対 events(多)

  validates :name, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { in: 4..20 }

  has_secure_password
end
