class CreateSurveyResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :survey_responses do |t|
      t.text :interest
      t.text :values
      t.text :goals
      t.text :top_issues
      t.string :meeting_preferences
      t.text :involvement
      t.text :skills
      t.string :availability
      t.boolean :contact_permission
      t.string :contact_method
      t.text :political_background
      t.text :demographics
      t.text :community_impact
      t.boolean :fundraising
      t.text :networking
      t.text :feedback

      t.timestamps
    end
  end
end
