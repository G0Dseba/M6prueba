class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :photo, :string
    add_column :users, :relevant_data, :text
  end
end
