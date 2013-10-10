ShirtApp::Application.routes.draw do
  get "aboutus" => "aboutus#index"
  root "shirts#index"
  resources :shirts
end
