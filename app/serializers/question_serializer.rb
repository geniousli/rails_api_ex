class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :created_at, :updated_at
  has_one :user, serializer: UserBrefSerializer, key: :user_bref
end
