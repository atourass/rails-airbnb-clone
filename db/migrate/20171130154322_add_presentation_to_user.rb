class AddPresentationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :presentation, :string
  end
end
