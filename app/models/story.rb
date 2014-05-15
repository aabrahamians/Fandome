class Story
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  field :datecreated, type: Time

  belongs_to :story
  belongs_to :user
end
