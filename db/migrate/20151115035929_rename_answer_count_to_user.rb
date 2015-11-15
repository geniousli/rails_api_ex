class RenameAnswerCountToUser < ActiveRecord::Migration
  def change
    rename_column :users, :answer_count, :answers_count
  end
end
