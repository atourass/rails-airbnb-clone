class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :presentation, :text
  end
end
