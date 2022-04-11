class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }  # 空不可、文字数制限
  validates :start, presence: true  # 空不可
  validates :end, presence: true  # 空不可
  validate :start_end_check  # 開始 < 終了 
  
  private

  def start_end_check
    if self.start.present? && self.end.present?
      errors.add(:end, "を正しく入力して下さい。") if self.start > self.end
    end
  end 
end
