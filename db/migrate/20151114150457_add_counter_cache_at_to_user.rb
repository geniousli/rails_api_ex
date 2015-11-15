class AddCounterCacheAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :questions_count, :integer
    add_column :users, :answer_count, :integer
  end
end
