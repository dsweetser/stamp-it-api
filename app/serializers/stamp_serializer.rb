# frozen_string_literal:true

class StampSerializer < ActiveModel::Serializer
  attributes :id, :link, :monochrome_link, :cost
end
