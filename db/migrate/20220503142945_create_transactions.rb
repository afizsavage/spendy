class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.references :category, null: false, foreign_key: { to_table: :categories }, index: true
      t.string 'name'
      t.decimal 'amount'
      t.timestamps
    end
  end
end
