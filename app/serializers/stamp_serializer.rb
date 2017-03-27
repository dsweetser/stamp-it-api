# frozen_string_literal:true

class StampSerializer < ActiveModel::Serializer
  attributes :id, :order_id, :link, :monochrome_link, :cost

  def order_id
    object.order.id
  end
end
