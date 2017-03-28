# frozen_string_literal:true

class Order < ApplicationRecord
  belongs_to :user
  has_many :stamps, through: :list_items
  has_many :list_items

  validates :shipping_address, length: { maximum: 500 }, presence: true
  validates :billing_address, length: { maximum: 500 }, presence: true
  validates :total, presence: true
end
