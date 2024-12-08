class SurveyResponsesController < ApplicationController
  def new
    @survey_response = SurveyResponse.new
  end

  def create
    @survey_response = SurveyResponse.new(survey_response_params)
    if @survey_response.save
      redirect_to root_path, notice: "Thank you for your response!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_response_params
    params.require(:survey_response).permit(
      :email, :discord_handle,
      :interest, :values, :goals, :top_issues, :meeting_preferences,
      :involvement, :skills, :availability, :contact_permission,
      :contact_method, :political_background, :demographics,
      :community_impact, :fundraising, :networking, :feedback
    )
  end
end
