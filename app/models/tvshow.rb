class Tvshow
  include Mongoid::Document
  field :name, type: String
  field :genre, type: String

  has_many :characters
  belongs_to :user
end
