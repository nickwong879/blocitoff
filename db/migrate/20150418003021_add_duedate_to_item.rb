class AddDuedateToItem < ActiveRecord::Migration
  def change
    add_column :items, :due_date, :datetime
  end
end
