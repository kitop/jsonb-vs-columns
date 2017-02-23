class AddIndexToPublishingJsonbs < ActiveRecord::Migration[5.0]
  def change
    add_index :publishing_jsonbs, :options, using: :gin
  end
end
