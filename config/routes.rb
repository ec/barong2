Rails.application.routes.draw do
  mount UserApi::Base, at: '/api'
end
