class Note < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :topic
end
