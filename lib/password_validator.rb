require './spec/tests'
require 'pry'

class PasswordValidator
	def long_enough?(password)
		password.length > 7
	end

	def contain_characters?(password)
		password.match(/([a-z]+)/) && password.match(/([A-Z]+)/) && password.match(/(\d+)/) && password.match(/(\W+)/)
	end

	def contains_email_or_domain?(email, password)
		username = email.split(/@/).first
		domain = email.split(/@/).last.split(".").first
		password.include?(username) || password.include?(domain)
	end

	def validate_password(email, password)
		long_enough?(password) && contain_characters?(password) && !contains_email_or_domain?(email, password)
	end
end