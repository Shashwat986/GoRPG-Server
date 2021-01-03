Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'rank/:rank' do
    post 'genmove(/:color)', to: 'game#genmove'
  end
end
