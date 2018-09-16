class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # This ensures that we also have uniqueness in the DB level, not just in the model.
    add_index :users, :email, unique: true
  end
end
