require 'sidekiq'
require 'sidekiq/web'

Rails.application.routes.draw do
  namespace 'api' do
    resources :diaries
    resources :notes
  end

  get('index' => 'api/diaries#index')
  post('create' => 'api/diaries#create')

  get('index' => 'api/notes#index')
  post('create_note' => 'api/notes#create')


  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == ["admin", "12345"]
  end
  mount Sidekiq::Web => '/sidekiq'
end
