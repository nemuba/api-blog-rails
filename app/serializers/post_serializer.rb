class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at
  has_one :user
  has_many :comments

  def created_at
    object.created_at.strftime('%d/%m/%Y')
  end
  

end
