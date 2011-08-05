require 'spec_helper'

describe "Account model" do
  let(:account) { Account.new(:name => "Foo", :email => "this@example.com", :password => "bar") }
  
  it "can be created" do
    account.should_not be_nil
  end
end
