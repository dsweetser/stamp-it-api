# frozen_string_literal:true

class ListItem < ApplicationRecord
  belongs_to :stamp
  belongs_to :order
end
