class Event < ApplicationRecord
  belongs_to :user # user(1) 対 events(多い)

  validates :name, presence: true, length: { maximum: 100 }  # 空不可、文字数制限
  validates :start, presence: true  # 空不可
  validates :end, presence: true  # 空不可
  validates :user_id, presence: true  # User_id必須
end
