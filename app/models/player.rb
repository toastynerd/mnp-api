class Player < ApplicationRecord
  validates :name, :team, :role, presence: true
  validates :role, inclusion: {in: %w(captain assistant player)}
end
