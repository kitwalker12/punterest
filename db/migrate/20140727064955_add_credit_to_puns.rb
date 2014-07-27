class AddCreditToPuns < ActiveRecord::Migration
  def change
    add_column :puns, :credit, :string
  end
end
