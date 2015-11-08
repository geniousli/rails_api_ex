class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :blogs_count, :blog_ids
  has_many :blogs, serializer: BlogSerializer, key: :blogs_bref

  def blogs_count
    object.blogs.count
  end

  def blog_ids
    object.blogs.limit(10).map(&:id)
  end
end
