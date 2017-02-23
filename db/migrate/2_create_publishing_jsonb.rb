class CreatePublishingJsonb< ActiveRecord::Migration[5.0]
  def change
    create_table :publishing_jsonbs do |t|
      t.jsonb :options, null: false
    end
  end
end
