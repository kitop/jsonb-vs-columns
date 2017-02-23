require_relative "../models"

def rand_bool
  rand(2) == 0
end

ActiveRecord::Base.transaction do
  10_000.times do |i|
    options = {
      visible: rand_bool,
      featured: rand_bool,
      in_carousel: rand_bool,
      carousel_position: rand(i) + 1
    }

    PublishingColumn.create! options
    PublishingJsonb.create! options: options
  end
end
