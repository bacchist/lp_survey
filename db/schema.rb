# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_08_194429) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "survey_responses", force: :cascade do |t|
    t.text "interest"
    t.text "values"
    t.text "goals"
    t.text "top_issues"
    t.string "meeting_preferences"
    t.text "involvement"
    t.text "skills"
    t.string "availability"
    t.boolean "contact_permission"
    t.string "contact_method"
    t.text "political_background"
    t.text "demographics"
    t.text "community_impact"
    t.boolean "fundraising"
    t.text "networking"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "discord_handle"
  end
end
