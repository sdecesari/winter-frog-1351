Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plots', to: 'plots#index'
  get '/plots/:plot_id/plants/:plant_id', to: 'plant_plots#delete'
end
