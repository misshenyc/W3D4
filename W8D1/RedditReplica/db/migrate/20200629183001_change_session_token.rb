class ChangeSessionToken < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :sesion_token, :session_token
  end
end
