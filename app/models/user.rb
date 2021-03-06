class User < ApplicationRecord
  has_many :tasks
  
  before_save {self.email.downcase!}
  has_secure_password
  validates :name, presence: true, length: {maximum:25}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
end
