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

ActiveRecord::Schema.define(version: 20170104111907) do

  create_table "Videocats_Videos", id: false, force: :cascade do |t|
    t.integer "video_id",    null: false
    t.integer "videocat_id", null: false
    t.index ["video_id", "videocat_id"], name: "index_Videocats_Videos_on_video_id_and_videocat_id"
    t.index ["videocat_id", "video_id"], name: "index_Videocats_Videos_on_videocat_id_and_video_id"
  end

  create_table "areas", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_areas_on_city_id"
  end

  create_table "buttons", force: :cascade do |t|
    t.string   "location"
    t.integer  "clicks",     default: 0, null: false
    t.integer  "views",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carbrands", force: :cascade do |t|
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "carlistings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "carmodel_id"
    t.integer  "area_id"
    t.integer  "cartype_id"
    t.boolean  "automatic"
    t.boolean  "fourdoor"
    t.integer  "year"
    t.integer  "engine"
    t.integer  "milleage"
    t.integer  "price"
    t.integer  "tire"
    t.boolean  "ac"
    t.boolean  "electricwindow"
    t.boolean  "sunroof"
    t.boolean  "abs"
    t.boolean  "ebd"
    t.boolean  "centerlock"
    t.boolean  "alarm"
    t.boolean  "cruisecontrol"
    t.boolean  "powersteering"
    t.boolean  "airbag"
    t.boolean  "music"
    t.boolean  "electricmirror"
    t.boolean  "foldingmirror"
    t.text     "details"
    t.string   "phone"
    t.string   "photo_one_file_name"
    t.string   "photo_one_content_type"
    t.integer  "photo_one_file_size"
    t.datetime "photo_one_updated_at"
    t.string   "photo_two_file_name"
    t.string   "photo_two_content_type"
    t.integer  "photo_two_file_size"
    t.datetime "photo_two_updated_at"
    t.string   "photo_three_file_name"
    t.string   "photo_three_content_type"
    t.integer  "photo_three_file_size"
    t.datetime "photo_three_updated_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["area_id"], name: "index_carlistings_on_area_id"
    t.index ["carmodel_id"], name: "index_carlistings_on_carmodel_id"
    t.index ["cartype_id"], name: "index_carlistings_on_cartype_id"
    t.index ["user_id"], name: "index_carlistings_on_user_id"
  end

  create_table "carmodels", force: :cascade do |t|
    t.integer  "carbrand_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["carbrand_id"], name: "index_carmodels_on_carbrand_id"
  end

  create_table "cartypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_companies_on_category_id"
  end

  create_table "complaintcomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "complaint_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_complaintcomments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_complaintcomments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_complaintcomments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_complaintcomments_on_cached_votes_up"
    t.index ["complaint_id"], name: "index_complaintcomments_on_complaint_id"
    t.index ["user_id"], name: "index_complaintcomments_on_user_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.text     "content"
    t.boolean  "approved",                 default: false
    t.string   "companymanual"
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "photo_one_file_name"
    t.string   "photo_one_content_type"
    t.integer  "photo_one_file_size"
    t.datetime "photo_one_updated_at"
    t.string   "photo_two_file_name"
    t.string   "photo_two_content_type"
    t.integer  "photo_two_file_size"
    t.datetime "photo_two_updated_at"
    t.string   "photo_three_file_name"
    t.string   "photo_three_content_type"
    t.integer  "photo_three_file_size"
    t.datetime "photo_three_updated_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "cached_votes_total",       default: 0
    t.integer  "cached_votes_score",       default: 0
    t.integer  "cached_votes_up",          default: 0
    t.integer  "cached_votes_down",        default: 0
    t.index ["cached_votes_down"], name: "index_complaints_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_complaints_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_complaints_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_complaints_on_cached_votes_up"
    t.index ["company_id"], name: "index_complaints_on_company_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "contactmes", force: :cascade do |t|
    t.integer  "regarding_id"
    t.integer  "user_id"
    t.text     "content"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["regarding_id"], name: "index_contactmes_on_regarding_id"
    t.index ["user_id"], name: "index_contactmes_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.text     "definition"
    t.text     "example"
    t.integer  "user_id"
    t.integer  "word_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_definitions_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_definitions_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_definitions_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_definitions_on_cached_votes_up"
    t.index ["user_id"], name: "index_definitions_on_user_id"
    t.index ["word_id"], name: "index_definitions_on_word_id"
  end

  create_table "explanations", force: :cascade do |t|
    t.text     "explanation"
    t.integer  "user_id"
    t.integer  "query_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_explanations_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_explanations_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_explanations_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_explanations_on_cached_votes_up"
    t.index ["query_id"], name: "index_explanations_on_query_id"
    t.index ["user_id"], name: "index_explanations_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "memecomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "meme_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_memecomments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_memecomments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_memecomments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_memecomments_on_cached_votes_up"
    t.index ["meme_id"], name: "index_memecomments_on_meme_id"
    t.index ["user_id"], name: "index_memecomments_on_user_id"
  end

  create_table "memes", force: :cascade do |t|
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.boolean  "trending",           default: false
    t.boolean  "hot",                default: false
    t.boolean  "arabic",             default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_memes_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_memes_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_memes_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_memes_on_cached_votes_up"
    t.index ["user_id"], name: "index_memes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offercategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offerrequests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.text     "details"
    t.integer  "quantity"
    t.boolean  "accepted"
    t.boolean  "delivered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offerrequests_on_offer_id"
    t.index ["user_id"], name: "index_offerrequests_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "details"
    t.integer  "delivery"
    t.integer  "price"
    t.boolean  "approved",           default: false
    t.integer  "offercategory_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["offercategory_id"], name: "index_offers_on_offercategory_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "postcomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_postcomments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_postcomments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_postcomments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_postcomments_on_cached_votes_up"
    t.index ["post_id"], name: "index_postcomments_on_post_id"
    t.index ["user_id"], name: "index_postcomments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.boolean  "public",                 default: false
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "photo_one_file_name"
    t.string   "photo_one_content_type"
    t.integer  "photo_one_file_size"
    t.datetime "photo_one_updated_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "cached_votes_total",     default: 0
    t.integer  "cached_votes_score",     default: 0
    t.integer  "cached_votes_up",        default: 0
    t.integer  "cached_votes_down",      default: 0
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "super",      default: false
  end

  create_table "queries", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "querycategory_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["querycategory_id"], name: "index_queries_on_querycategory_id"
    t.index ["user_id"], name: "index_queries_on_user_id"
  end

  create_table "querycategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regardings", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secrets", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_secrets_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "done",       default: false
    t.boolean  "deleted",    default: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "tweetacomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "tweetamela5er_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_tweetacomments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_tweetacomments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_tweetacomments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_tweetacomments_on_cached_votes_up"
    t.index ["tweetamela5er_id"], name: "index_tweetacomments_on_tweetamela5er_id"
    t.index ["user_id"], name: "index_tweetacomments_on_user_id"
  end

  create_table "tweetamela5ers", force: :cascade do |t|
    t.string   "url"
    t.boolean  "covered",            default: false
    t.boolean  "approved",           default: false
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["cached_votes_down"], name: "index_tweetamela5ers_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_tweetamela5ers_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_tweetamela5ers_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_tweetamela5ers_on_cached_votes_up"
    t.index ["user_id"], name: "index_tweetamela5ers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "birthday"
    t.string   "location"
    t.boolean  "tester",                 default: false
    t.boolean  "moderator",              default: false
    t.boolean  "admin",                  default: false
    t.string   "image",                  default: "/assets/babychicken.png", null: false
    t.string   "email",                  default: "",                        null: false
    t.string   "encrypted_password",     default: "",                        null: false
    t.text     "about"
    t.string   "display_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "videocats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videocomments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_videocomments_on_user_id"
    t.index ["video_id"], name: "index_videocomments_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cached_votes_total",     default: 0
    t.integer  "cached_votes_score",     default: 0
    t.integer  "cached_votes_up",        default: 0
    t.integer  "cached_votes_down",      default: 0
    t.index ["cached_votes_down"], name: "index_videos_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_videos_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_videos_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_videos_on_cached_votes_up"
  end

  create_table "visitoremails", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  create_table "wallmessages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallmessages_on_user_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
