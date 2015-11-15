class AddLastAnsweredAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_answered_at, :datetime
  end
end
