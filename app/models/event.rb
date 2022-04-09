class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 } # 空不可、文字数制限
  validates :start, presence: true # 空不可
  validates :end, presence: true # 空不可
end
