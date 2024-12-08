Rails.application.routes.draw do
  root 'survey_responses#new'
  resources :survey_responses, only: [:new, :create]
end
