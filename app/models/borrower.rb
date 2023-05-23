class Borrower < ApplicationRecord
    validates_presence_of :name, :phone, :address
    validates_uniqueness_of :phone
end
