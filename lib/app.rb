# frozen_string_literal: true

class GossipProjectApp < Sinatra::Base
  get '/' do
    erb :index, locals: { gossips: Gossip.all }
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new' do
    Gossip.new(params[:gossip_author], params[:gossip_content]).save
    redirect '/'
  end

  get '/gossips/:id' do
    if params[:id].match(/\A\d+\Z/).nil?
      erb :profil_gossip, locals: { gossip: nil }
    else
      erb :profil_gossip, locals: { gossip: Gossip.find(params[:id].to_i) }
    end
  end
  get '/gossips/:id/delete' do
    Gossip.delete(params[:id].to_i) unless params[:id].match(/\A\d+\Z/).nil?
    redirect '/'
  end
end
