class PostsController < ApplicationController

    get '/posts' do
      "youre logged in #{session[:username]}!"
    end
end
