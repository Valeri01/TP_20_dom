class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :rid
      t.text :messages

      t.timestamps
    end
  end
end
