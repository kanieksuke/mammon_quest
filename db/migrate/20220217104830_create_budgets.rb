class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :attack, null: false
      t.integer :resist, null: false
      t.references :target, null: false
      t.timestamps
    end
  end
end
