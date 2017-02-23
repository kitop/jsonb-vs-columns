class CreatePublishingColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :publishing_columns do |t|
      t.boolean :visible, null: false
      t.boolean :featured, null: false
      t.boolean :in_carousel, null: false
      t.integer :carousel_position
    end
  end
end
