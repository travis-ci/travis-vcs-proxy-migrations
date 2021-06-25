# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email,              null: false
      t.string   :encrypted_password, null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.string   :encrypted_otp_secret
      t.string   :encrypted_otp_secret_iv
      t.string   :encrypted_otp_secret_salt
      t.integer  :consumed_timestep
      t.boolean  :otp_required_for_login
      t.string   :otp_backup_codes, array: true
      t.string   :jti

      t.string   :confirmation_token
      t.datetime :confirmation_sent_at
      t.datetime :confirmed_at
      t.string   :unconfirmed_email
      t.string   :type,               null: false, default: ''
      t.datetime :created_at,         null: false
      t.boolean  :active,             default: true
    end

    add_index :users, :email,                unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :jti,                  unique: true
  end
end
