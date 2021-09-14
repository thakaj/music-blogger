class Post < ApplicationRecord
    belongs_to :user
    belongs_to :artist
    has_many :comments, dependent: :destroy
    validates :body, presence: true 
    validates :title, presence: true
end
