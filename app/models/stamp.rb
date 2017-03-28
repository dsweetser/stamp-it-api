# frozen_string_literal:true

class Stamp < ApplicationRecord
  has_many :orders, through: :list_items
  has_many :list_items

  validates :cost, presence: true
end
