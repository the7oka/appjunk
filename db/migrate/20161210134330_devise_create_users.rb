class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :provider
      t.string :uid
      t.string :username
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.string :gender ,    default: 'male'
      t.string :birthday
      t.string :location
      t.boolean :tester,    default: false
      t.boolean :moderator, default: false
      t.boolean :admin,     default: false
      t.string :image,      null: false, default: "/assets/babychicken.png"
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.text :about
      t.string :display_name
      t.attachment :avatar
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :username,                unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end