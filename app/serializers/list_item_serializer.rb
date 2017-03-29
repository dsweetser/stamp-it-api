class ListItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :stamp
  has_one :order

  def order
    object.order.id
  end

  def stamp
    object.stamp.id
  end
end
