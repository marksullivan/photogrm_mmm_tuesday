class CreatePhotoComments < ActiveRecord::Migration
  def change
    create_table :photo_comments do |t|

      t.timestamps

    end
  end
end
