class ImageCreateSerializer < ActiveModel::Serializer
  attributes :id, :detail
  #attribute :user, serializer: UserSerializer
  #attribute :event, serializer: EventSerializer

  def detail
    'Slika je uspješno prenesena'
  end
end
