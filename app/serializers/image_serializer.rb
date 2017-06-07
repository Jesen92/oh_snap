class ImageSerializer < ActiveModel::Serializer
  attributes :id, :detail, :user, :event

  def detail
    'Slika je uspješno prenesena'
  end
end
