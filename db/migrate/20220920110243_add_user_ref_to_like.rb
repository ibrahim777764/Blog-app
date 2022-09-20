# frozen_string_literal: true

class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
  end
end
