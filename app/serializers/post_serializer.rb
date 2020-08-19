class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :liked, :created_at
  has_one :user
  has_many :comments
  has_many :likes

  def created_at
    object.created_at.strftime('%d/%m/%Y')
  end

  def likes
    object.likes.count
  end

  def liked
    object.likes.find_by(user: scope) ? true : false
  end
  
  

end
