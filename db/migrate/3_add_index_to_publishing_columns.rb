class AddIndexToPublishingColumns < ActiveRecord::Migration[5.0]
  def change
    add_index :publishing_columns, [:visible, :featured]
    add_index :publishing_columns, [:in_carousel, :carousel_position]
  end
end
