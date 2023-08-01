class CreateDownloads < ActiveRecord::Migration[7.0]
  def change
    create_table :downloads do |t|
      t.string :rails_version
      t.string :app_type
      t.string :ruby_version
      t.string :database
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
