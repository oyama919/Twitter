Rails.application.routes.draw do
    resources :blogs, except: [:show] do
        collection do
               post :confirm_new
            end
        member do 
               post :confirm_edit
            end
             
    end        
end
