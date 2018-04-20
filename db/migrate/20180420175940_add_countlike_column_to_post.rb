class AddCountlikeColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :countlike, :integer
  end
end
