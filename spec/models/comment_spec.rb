require File.expand_path("../../spec_helper", __FILE__)

describe Comment  do
  it "should be valid" do
    FactoryGirl.build(:comment).should be_valid
  end

end
