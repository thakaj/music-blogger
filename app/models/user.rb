class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :artists, through: :posts
    has_many :comments, through: :posts, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    has_secure_password
end
