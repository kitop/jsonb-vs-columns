class JsonPathIndexToPublishingJsonbs < ActiveRecord::Migration[5.0]
  def change
    remove_index :publishing_jsonbs, :options
    add_index :publishing_jsonbs, 'options jsonb_path_ops', using: :gin
  end
end

