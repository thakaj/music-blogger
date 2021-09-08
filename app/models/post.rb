class Post < ApplicationRecord
    belongs_to :user
    belongs_to :artist
    validates :body, presence: true
end
