class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	t.text    :body
    	t.integer :user_id
    	t.integer :comentable_id
    	t.string  :comentable_type

      t.timestamps
    end
  end
end
