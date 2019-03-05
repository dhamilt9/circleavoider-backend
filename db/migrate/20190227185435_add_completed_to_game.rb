class AddCompletedToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :completed, :boolean, default: false
  end
end
