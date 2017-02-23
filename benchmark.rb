require "bundler/setup"
require "active_record"
require "benchmark/ips"
require "./models"

Benchmark.ips do |x|
  x.report("columns visible") do
    PublishingColumn.visible.count
  end

  x.report("jsonb visible") do
    PublishingJsonb.visible.count
  end

  x.compare!
end

Benchmark.ips do |x|

  x.report("columns in carousel") do
    PublishingColumn.in_carousel.count
  end

  x.report("jsonb in carousel") do
    PublishingJsonb.in_carousel.count
  end

  x.compare!
end

Benchmark.ips do |x|
  x.report("column visible and featured") do
    PublishingColumn.visible.featured.count
  end

  x.report("jsonb visible and featured") do
    PublishingJsonb.visible.featured.count
  end

  x.compare!
end
