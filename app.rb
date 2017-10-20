# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  @contacts = Lead.all
  erb :index
end


class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end

class Lead < ActiveRecord::Base
  self.table_name = 'salesforce.lead'
end

get "/contacts" do
  @contacts = Contact.all
  erb :index
end

get "/leads" do
  @contacts = Lead.all
  erb :index
end

get "/add" do
  Lead.create(:company => 'salesforce2', :firstname => 'test', :lastname => 'taro', :email => 'taro3@test.com')
  @contacts = Lead.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
