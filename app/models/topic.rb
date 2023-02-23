class Topic < ApplicationRecord
  has_many :notes

  def name_with_icon
    "#{icon} #{name}"
  end
end
