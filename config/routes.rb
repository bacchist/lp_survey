Rails.application.routes.draw do
  root 'survey_responses#new'
  
  get 'survey/:step', to: 'survey_responses#show_step', as: :survey_step
  patch 'survey/:step', to: 'survey_responses#update_step', as: :update_survey_step
  get 'completion', to: 'survey_responses#completion', as: :completion
end
