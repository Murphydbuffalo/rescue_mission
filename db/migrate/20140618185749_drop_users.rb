class DropUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
  	create_table :users do |t|
    	t.string :name, null: false
    end
  end
end
