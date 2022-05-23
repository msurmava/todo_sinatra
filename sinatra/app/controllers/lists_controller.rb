require './config/environment'
class ListsController < ApplicationController 

get '/lists' do
  erb :showlists
end

end
  