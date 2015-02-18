class MakeMediaSharable < ActiveRecord::Migration
  def change
  	add_column :media_items, :shared, :boolean, default: false
  end
end
