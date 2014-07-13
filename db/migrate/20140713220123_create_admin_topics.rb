class CreateAdminTopics < ActiveRecord::Migration
  def change
    create_table :admin_topics do |t|
      t.string :title
      t.text :content
      t.integer :clicks

      t.timestamps
    end
  end
end
