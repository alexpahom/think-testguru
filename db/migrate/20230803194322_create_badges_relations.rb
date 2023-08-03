class CreateBadgesRelations < ActiveRecord::Migration[6.1]
  enable_extension 'hstore' unless extension_enabled?('hstore')

  def change
    create_table :achievements do |t|
      t.string :text, null: false, index: { unique: true }

      t.timestamps
    end

    create_table :badges do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false

      t.timestamps
    end

    create_table :rules do |t|
      t.hstore :options
      t.references :achievement, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end

    create_table :badge_images do |t|
      t.string :url, null: false
      t.belongs_to :badge

      t.timestamps
    end

    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
