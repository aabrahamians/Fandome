class User
  include Mongoid::Document
  field :author, type: String

  has_many :stories
end
