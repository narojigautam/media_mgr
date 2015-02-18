class ChangeMediaTypeColumn < ActiveRecord::Migration
  def change
  	rename_column :media_items, :type, :media_type
  end
end
