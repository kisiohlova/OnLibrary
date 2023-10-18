class ChangeColumnsNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :description, true
    change_column_null :books, :isbn, false
  end
end
