class AddContactFieldsToSurveyResponses < ActiveRecord::Migration[7.2]
  def change
    add_column :survey_responses, :email, :string
    add_column :survey_responses, :discord_handle, :string
  end
end
