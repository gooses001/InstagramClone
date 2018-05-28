ActiveRecord::Schema.define(version: 20180528121458) do

  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "content"
  end

end
