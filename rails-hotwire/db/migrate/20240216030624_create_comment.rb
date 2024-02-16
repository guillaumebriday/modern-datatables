# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :description
      t.references :todo

      t.timestamps
    end
  end
end
