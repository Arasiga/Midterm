# Homepage (Root path)
get '/' do
  erb :'Webpages/Signin'
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
    password: params[:password]
  )

  if @user.save
    redirect '/'
  else
    erb :'Webpages/Signup'
  end
end


