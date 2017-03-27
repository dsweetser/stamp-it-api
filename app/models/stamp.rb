# frozen_string_literal:true

class Stamp < ApplicationRecord
  belongs_to :order

  validates :cost, presence: true
end
