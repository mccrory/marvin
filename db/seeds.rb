email     = shell.ask "Which email do you want to use?"
password  = shell.ask "What do you want your password to be?"

shell.say ""

account = Account.create(:email => email, :name => "Foo", :surname => "Bar", :password => password)

if account.valid?
  shell.say "================================================================="
  shell.say "Account has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{password}"
  shell.say "================================================================="
else
  shell.say "Sorry, but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""
