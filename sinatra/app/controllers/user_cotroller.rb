class UserController < ApplicationController 

  get '/registration' do
    if logged_in?
      redirect '/lists'
    else
    erb :'users/registration'
    end
  end


  post '/registration' do
    if params[:name] == "" || params[:email] == "" || params[:password] == "" 
      redirect to '/'
    else
      @user=User.create(:full_name => params[:name], :email => params[:email], :password =>params[:password])
     session[:user_id] = @user.id 
     redirect to '/profile'
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/'
  end

  get '/login' do
    if logged_in?
      redirect '/profile'
    else
      erb :index
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/profile'
    else
      redirect '/login'
    end
  end

  get '/profile' do
    @user = User.find(session['user_id'])
    erb :'users/profile'
  end

  get '/edit' do
    @user = User.find(session[:user_id])
    if @user
      erb :'users/edit'
    else
      redirect to "/"
    end
  end

  patch "/edit/:user_id" do
    @user = User.find(params[:user_id])
    @user.password = params[:password] #unless params[:password] == ""
    @user.save
    redirect to '/about'
  end
  



end
