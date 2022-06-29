class CreateFootPrints < ActiveRecord::Migration[6.1]
  def change
    create_table :foot_prints do |t|
      t.integer :book_id
      t.integer :user_id
      t.timestamps
    end
  end
end
