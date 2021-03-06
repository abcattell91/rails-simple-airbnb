# frozen_string_literal: true

class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guests, :picture_url, presence: true
end
