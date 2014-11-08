class CreateDisputes < ActiveRecord::Migration
  def change
    create_table :disputes do |t|
      t.string :company
      t.string :policy_name
      t.string :policy_text
      t.string :policy_link

      t.timestamps
    end
  end
end
