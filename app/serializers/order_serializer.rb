# frozen_string_literal:true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :stamp_id, :paid, :total, :billing_address, :user

  def user
    object.user.id
  end
end