class ImagesSerializer < ActiveModel::Serializer
  attributes :id, :path_to_image, :width, :height
end
