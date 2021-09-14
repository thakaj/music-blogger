class Artist < ApplicationRecord
    has_many :albums, dependent: :destroy
    has_many :posts
    has_many :users, through: :posts
    validates :name, presence: true
end
