# Homepage (Root path)
get '/' do
  session[:user_id] = nil
  erb :'Webpages/Signin'
end

post '/' do 

  @username = params[:username]
  @password = params[:password]

  @user = User.find_by(username: @username)
  
  if @user && @password == @user.password
    session[:user_id] = @user.id
    redirect '/Webpages/page'
  else 
    @login_failed = true
    erb :'Webpages/Signin'
  end
end

get '/Webpages/page' do
  erb :'Webpages/page'
end

get '/Webpages/Signup' do
  erb :'Webpages/Signup'
end

get '/Webpages/about' do
  erb :'Webpages/about'
end

post '/Webpages/Signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    country: params[:country],
    email: params[:email],
    username: params[:username],
    password: params[:password],
    repeat_password: params[:repeat_password]
  )
  if @user.save
    redirect '/'
  else
    erb :'Webpages/Signup'
  end
end

get '/Webpages/database' do
  @users = User.all
  erb :'Webpages/database'
end


