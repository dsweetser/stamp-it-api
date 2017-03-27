# frozen_string_literal:true

class StampSerializer < ActiveModel::Serializer
  attributes :id, :order, :link, :monochrome_link, :cost

  def order
    object.order.id
  end
end
