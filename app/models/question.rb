class Question < ActiveRecord::Base

  belongs_to :user, touch: :last_answered_at, counter_cache: true
  has_many :answers

  validates :user, presence: true
  validates :title, :content, presence: true
  validates :title, uniqueness: {scope: :user_id}
end
