get '/' do

  erb :index
end

post '/sign_in' do
  @dummy = User.authenticate(params[:email], params[:password]) #2

  if @dummy
    session[:dummy_id] = @dummy.id
    redirect to '/page'
  else
    session[:error] = "Invalid username or password."
    redirect to '/'
  end
end

get '/page' do
  if session[:dummy_id].nil?
    redirect '/'
  end
  erb :page
end

get '/sign_out' do
  session.delete("dummy_id")
  erb :sign_out
end

get '/create_account' do

  erb :create_account
end

post '/sign_up' do
  byebug
  @account = User.create(params[:dummy])
  # @account = User.create(full_name: params[:full_name], email: params[:email], password: params[:password])
  erb :index
end