class CreateClauses < ActiveRecord::Migration
  def change
    create_table :clauses do |t|
      t.integer :dispute_id
      t.string :clause_text
      t.string :clause_status
      t.integer :clause_count

      t.timestamps
    end
  end
end
