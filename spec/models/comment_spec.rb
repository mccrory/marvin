require 'spec_helper'

describe "Comment model" do
  let(:comment) { Comment.new }
  
  it "can be created" do
    comment.should_not be_nil
  end
end
