class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
