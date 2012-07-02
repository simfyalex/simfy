require File.expand_path("../../spec_helper", __FILE__)

describe User  do
  pending "TODO. This is just basic examples for testing purpose."

  it "should be valid" do
    FactoryGirl.build(:user).should be_valid
  end

  it "should require a username" do
    FactoryGirl.build(:user, :username => "").should_not be_valid
  end
end
