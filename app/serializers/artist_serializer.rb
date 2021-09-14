class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :posts
  has_many :albums
end
