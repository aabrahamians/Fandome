class Tvshow
  include Mongoid::Document
  field :name, type: String
  field :genre, type: String
end
