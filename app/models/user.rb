class User < ApplicationRecord
    has_many :posts
    has_many :comments
    validates :name, presence: true
    validates :name, uniqueness: true
end
