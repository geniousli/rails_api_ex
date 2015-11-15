class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, counter_cache: true

  validates :question, presence: true
  validates :user, presence: true

  validate :one_question_user_answer


  private

  def one_question_user_answer
    if Answer.where(question_id: question_id, user_id: user_id).count > 0
      errors.add(:base, "have one Answer please")
      false
    end
  end
end
