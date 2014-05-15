class Story
  include Mongoid::Document

  belongs_to :user
  belongs_to :character
end
