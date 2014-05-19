class Character
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  belongs_to  :tvshow
  belongs_to :user
  has_many :stories
  
end
