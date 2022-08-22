class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room

  with_options on: :step2 do
    validates :reservation2_start, presence: true
    validates :reservation2_end, presence: true
    validates :reservation2_people, presence: true
  end
  
  validate :start_date_check
  
  def start_date_check 
    errors.add(:reservation2_start,"開始日に過去の日付は指定できません") if reservation2_start.nil? || reservation2_start < Date.today
  end
end
