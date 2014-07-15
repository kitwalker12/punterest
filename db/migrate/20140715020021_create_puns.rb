class CreatePuns < ActiveRecord::Migration
  def change
    create_table :puns do |t|
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
