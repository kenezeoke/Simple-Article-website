class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum:6, maximum:100} # makes sure title is present for any article to be saved.
  # and it cant be less than 6 and more than 100 in length
  validates :description, presence: true, length: {minimum:10, maximum:300} #makes sure description is present for any article to be saved.
end
