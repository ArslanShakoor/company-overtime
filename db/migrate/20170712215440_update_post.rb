class UpdatePost < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :data, :date
  end
end
