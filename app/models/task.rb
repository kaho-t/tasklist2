class Task < ApplicationRecord
  belongs_to :user
  
  validates :content, {presence: true, length: {maximum: 140}}
  validates :status, {presence: true, length: {maximum: 10}}
end
