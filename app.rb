require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base

  get '/' do
    @peeps = Peep.all(order: :posted_at.desc)
    erb(:index)
  end

  get '/add_peep' do
    erb(:add_peep)
  end

  post '/' do
    Peep.create(body: params[:Peep], posted_at: Time.now.strftime('%d-%m-%Y %H:%M:%S'))
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/store_sign_up' do
    User.create(firstname: params[:firstname], surname: params[:surname], email: params[:email], password: params[:password])
    redirect '/sign_up_success'
  end

  get '/sign_up_success' do
    erb(:sign_up_success)
  end

end
