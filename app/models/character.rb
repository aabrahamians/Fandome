class Character
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  belongs_to  :tvshow
  has_many :stories
end
