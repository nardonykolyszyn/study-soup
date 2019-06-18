# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_up: 'signup', sign_out: 'logout' }
end
