Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :iclones do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
