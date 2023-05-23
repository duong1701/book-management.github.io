class Book < ApplicationRecord
  validates_presence_of :title, :author
  validates_numericality_of :quantity
end
