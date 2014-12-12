class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :basecamp_name
      t.string :email
      t.string :thoughtbot_email_name

      t.timestamps
    end
  end
end
