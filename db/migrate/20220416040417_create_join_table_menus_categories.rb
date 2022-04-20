class CreateJoinTableMenusCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :menus, :categories do |t|
      t.index [:menu_id, :category_id]
      t.index [:category_id, :menu_id]
    end
  end
end
