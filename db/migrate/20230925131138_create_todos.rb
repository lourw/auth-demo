# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :description
      t.datetime :create_date
      t.datetime :due_date
      t.boolean :is_complete

      t.timestamps
    end
  end
end
