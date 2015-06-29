class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :slug, :clicks, :snapshot, :title
end
