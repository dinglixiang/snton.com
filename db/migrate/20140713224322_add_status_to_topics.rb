class AddStatusToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :status, :string, default: "drafted"
  end
end
