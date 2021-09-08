class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
