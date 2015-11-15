class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :content
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
