require "bundler/setup"
require "active_record"
require "benchmark/ips"
require "./models"

Benchmark.ips do |x|
  x.report("columns visible") do
    PublishingColumn.visible.pluck(:id)
  end

  x.report("jsonb visible") do
    PublishingJsonb.visible.pluck(:id)
  end

  x.compare!
end

Benchmark.ips do |x|

  x.report("columns in carousel") do
    PublishingColumn.in_carousel.pluck(:id)
  end

  x.report("jsonb in carousel") do
    PublishingJsonb.in_carousel.pluck(:id)
  end

  x.compare!
end

Benchmark.ips do |x|
  x.report("column visible and featured") do
    PublishingColumn.visible.featured.pluck(:id)
  end

  x.report("jsonb visible and featured") do
    PublishingJsonb.visible.featured.pluck(:id)
  end

  x.compare!
end
