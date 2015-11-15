class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :question
  has_one :user, serializer: UserBrefSerializer, key: :user_bref
end
