# frozen_string_literal:true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :paid, :total, :shipping_address, :billing_address, :user

  def user
    object.user.id
  end
end
