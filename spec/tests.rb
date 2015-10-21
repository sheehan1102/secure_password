RSpec.describe "Password Validator" do
	before :each do
		@password_validator = PasswordValidator.new
	end

	it "makes sure the password is longer than 7 characters" do
		expect(@password_validator.long_enough?("password")).to be true
	end

	it "makes sure the password isn't too short" do
		expect(@password_validator.long_enough?("pass")).to be false
	end

	it "doesn't have 1 letter, 1 number and 1 symbol" do
		expect(@password_validator.contain_characters?("password")).to be_falsey
	end

	it "has 1 letter, 1 number and 1 symbol" do
		expect(@password_validator.contain_characters?("Password1#")).to be_truthy
	end

	it "has passwaord that does not contain either email or domain" do
		expect(@password_validator.contains_email_or_domain?("bob@example.com", "djisoajdi")).to be false
	end

	it "has password that contains either email or domain" do
		expect(@password_validator.contains_email_or_domain?("bob@example.com", "example")).to be true
	end

	it "does all password validation, returns false" do
		expect(@password_validator.validate_password("bob@example.com", "bob12345")).to be_falsey
	end

	it "does all password validation and passes" do
		expect(@password_validator.validate_password("bob@example.com", "Password1#")).to be true
	end
end






