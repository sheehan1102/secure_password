require 'sinatra'
require 'sinatra/reloader'
require 'rspec'
require 'pry'

require_relative "lib/password_validator"
require_relative "spec/tests"

get "/" do
	erb(:home)
end

post "/login" do
	if PasswordValidator.new.validate_password(params[:email], params[:password])
		redirect to('http://www.playbuzz.com/phoenixs10/which-unicorn-are-you')
	else
		redirect to("/")
	end
end