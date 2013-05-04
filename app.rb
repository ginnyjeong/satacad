require 'sinatra'
require 'sinatra/reloader'
require 'koala'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'ginny'
    if @password == 'jeong'
      redirect "/name?name=Alex&planet=Earth"
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  @state = params[:state]
  if @name == "collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end

get '/secrets' do
  return redirect '/' unless session [:user]
  @graph = Koala::Facebook :: API.new('BAACEdEose0cBAOXBUpW07cdH4nnCqdckBalqjliAZCkHsetJnPhOY2Kosd66911OK0Rn2Q7myzzlZA9lGnxjWg9uUdYzDeZCPqWohp7qPavxrmueacDKv5LcgCVRI3ZC7w8ykYSOpljph0AUWACU1xDsjOhetsgpTb6QJ3VQZBqUkbePr6ck2EzdR5izZB1H1yTlfaHZCcZCvZARUq03SShlWZATkCAGbfi4C9FmYNyFsI0QZDZD')
  @picture = @graph.get_picture('jpozelc')
  erb :secret
end

post '/go_here' do
  redirect "http://#{params[:place]}.com"
end

get '/logout' do
  sessions[:user] = nil
  redierct '/'
end