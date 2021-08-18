class Team < ApplicationRecord
  validates :key, uniqueness: true, length: { is: 3 }
end
