class Dictionary < ApplicationRecord
  has_one_attached :audio
  has_and_belongs_to_many :categories
end
