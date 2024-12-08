class SurveyResponsesController < ApplicationController
  before_action :load_survey_response, except: [:new, :completion]
  
  STEPS = ['contact', 'values', 'issues', 'involvement', 'additional']

  def new
    session[:survey_response] = {}
    redirect_to survey_step_path('contact')
  end

  def show_step
    @step = params[:step]
    @survey_response = SurveyResponse.new(session[:survey_response])
    @current_step_index = STEPS.index(@step)
    
    render "survey_responses/steps/#{@step}"
  end

  def update_step
    @step = params[:step]
    session[:survey_response] = session[:survey_response].merge(survey_params)
    @current_step_index = STEPS.index(@step)
    
    if @step == STEPS.last
      @survey_response = SurveyResponse.new(session[:survey_response])
      if @survey_response.save
        session.delete(:survey_response)
        redirect_to completion_path(status: :success)
      else
        redirect_to completion_path(status: :error), alert: @survey_response.errors.full_messages.join(", ")
      end
    else
      next_step = STEPS[@current_step_index + 1]
      redirect_to survey_step_path(next_step)
    end
  end

  def completion
    @status = params[:status]&.to_sym || :success
  end

  private

  def survey_params
    params.require(:survey_response).permit(
      :email, :discord_handle,
      :interest, :values, :goals, :top_issues, :meeting_preferences,
      :involvement, :skills, :availability, :contact_permission,
      :contact_method, :political_background, :demographics,
      :community_impact, :fundraising, :networking, :feedback
    )
  end

  def load_survey_response
    return if session[:survey_response]
    redirect_to root_path
  end
end
