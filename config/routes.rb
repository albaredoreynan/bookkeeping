Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :employees
  resources :account_infos do
    get :view_payroll, on: :collection
  end
  resources :payroll_records
end
