# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :AuthorId
      t.integer :PostId
      t.text :Text

      t.timestamps
    end
  end
end
