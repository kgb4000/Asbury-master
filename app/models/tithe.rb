class Tithe < ActiveRecord::Base

	validates :amount, numericality: { greater_than_or_equal_to: 5 }
end
