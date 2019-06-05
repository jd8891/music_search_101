class AddSearchCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :searches_count, :integer
  end
end
