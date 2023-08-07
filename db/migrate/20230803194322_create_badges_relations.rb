class CreateBadgesRelations < ActiveRecord::Migration[6.1]
  enable_extension 'hstore' unless extension_enabled?('hstore')

  def change
    create_table :rule_templates do |t|
      t.string :text, null: false, index: { unique: true }
      t.string :option_key

      t.timestamps
    end

    create_table :badge_images do |t|
      t.string :url, null: false

      t.timestamps
    end

    create_table :badges do |t|
      t.string :name, null: false, unique: true
      t.string :description, null: false
      t.string :rule_options
      t.references :rule_template, null: false, foreign_key: true
      t.references :badge_image, null: false, foreign_key: true

      t.timestamps
    end

    create_table :users_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
