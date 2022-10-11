class AddTextToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :string
  end
end
