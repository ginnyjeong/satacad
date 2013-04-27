require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'Aleeo34152'
    if @password == 'cookie'
      redirect "/name?name=Alex&planet=Earth"
    else
      if @username =='Chvatal'
        if @password =='Chvatal'
          redirect 'http://www.youtube.com/watch?v=eDU0CTDMk2g'
        end
      end
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end