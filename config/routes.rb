Rails.application.routes.draw do
  root 'iclones#index'
  resources :favorites
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :iclones do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
