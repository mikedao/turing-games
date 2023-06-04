class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :image_url

      t.timestamps
      # ! This migration also creates a rich text field called description
    end
  end
end
