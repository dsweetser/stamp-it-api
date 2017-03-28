class ListItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :stamp
  has_one :order
end
