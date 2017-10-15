class AddMarkdownToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :markdown, :text
  end
end
