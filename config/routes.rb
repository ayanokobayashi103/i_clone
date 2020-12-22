Rails.application.routes.draw do
  resources :iclones do
    collection do
      post :confirm
    end
  end
end
