class CreatrUsersEmail < ActiveRecord::Migration
  def up
  end

  def down
  end

   def change
    add_index :users, :email, unique: true
  end
end
