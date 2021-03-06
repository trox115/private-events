# frozen_string_literal: true

class AddUserReferencesToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, foreign_key: true
  end
end
