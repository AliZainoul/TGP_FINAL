class City < ApplicationRecord
  has_many :users
  #READ: 1 city has_many users, 1 user belongs_to 1 city (1 city : n users)
end
