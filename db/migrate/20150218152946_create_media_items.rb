class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string  :title
      t.string  :source
      t.string  :type
      t.text    :description
      t.integer :user_id
      t.timestamps
    end
  end
end
