# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8; Cache-Control=public; max-age=86400"
end

get "/" do
  erb :index, :layout => :layout
end
