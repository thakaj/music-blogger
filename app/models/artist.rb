class Artist < ApplicationRecord
    has_many :albums, dependent: :destroy
    has_many :posts
    validates :name, presence: true

end
