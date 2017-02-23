# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 4) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "publishing_columns", force: :cascade do |t|
    t.boolean "visible",           null: false
    t.boolean "featured",          null: false
    t.boolean "in_carousel",       null: false
    t.integer "carousel_position"
    t.index ["in_carousel", "carousel_position"], name: "index_publishing_columns_on_in_carousel_and_carousel_position", using: :btree
    t.index ["visible", "featured"], name: "index_publishing_columns_on_visible_and_featured", using: :btree
  end

  create_table "publishing_jsonbs", force: :cascade do |t|
    t.jsonb "options", null: false
    t.index ["options"], name: "index_publishing_jsonbs_on_options", using: :gin
  end

end
