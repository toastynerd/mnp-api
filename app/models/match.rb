class Match < ApplicationRecord
  validates :week, :home, :away, :venue, :date, presence: true
  validates :home, :away, :venue, length: { is: 3 }
end
