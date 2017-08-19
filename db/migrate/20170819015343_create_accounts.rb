class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.boolean :active
      t.string :phone, uniqueness: true
      t.string :code
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end

    add_index :accounts, :phone
    add_index :accounts, :code
  end
end
