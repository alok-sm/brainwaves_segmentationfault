class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :claim_text
      t.string :claim_status
      t.integer :claim_count

      t.timestamps
    end
  end
end
