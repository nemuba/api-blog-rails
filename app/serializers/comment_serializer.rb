class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at
  has_one :user
  has_one :post

  def created_at
    object.created_at.strftime('%d/%m/%Y')
  end
end
