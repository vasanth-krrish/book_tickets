class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :timings
end
