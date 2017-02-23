# frozen_string_literal: true
require "active_record"

class PublishingColumn < ActiveRecord::Base
  scope :visible, -> { where(visible: true) }
  scope :featured, -> { where(featured: true) }
  scope :in_carousel, -> { where(in_carousel: true)
                           .order("carousel_position asc") }
end

class PublishingJsonb < ActiveRecord::Base
  scope :visible, -> { where("options @> ?", '{"visible": true}') }
  scope :featured, -> { where("options @> ?", '{"featured": true}') }
  scope :in_carousel, -> {
    where("options @> ?", '{"in_carousel": true}')
    .order("options->'carousel_position' asc")
  }
end

config_dir = File.expand_path('../config', __FILE__)
ActiveRecord::Base.configurations = YAML.load(File.read(File.join(config_dir, 'database.yml')))
ActiveRecord::Base.establish_connection (ENV['ENV'] || 'development').to_sym
