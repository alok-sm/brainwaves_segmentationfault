class CreateClauses < ActiveRecord::Migration
  def change
    create_table :clauses do |t|
      t.integer :dispute_id
      t.text :clause_text
      t.string :clause_status

      t.timestamps
    end
  end
end
