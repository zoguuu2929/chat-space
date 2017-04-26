class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer :group_id, null: false
      t.integer :user_id,  null: false

      t.timestamps
    end
  end
end
