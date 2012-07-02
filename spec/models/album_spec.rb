require File.expand_path("../../spec_helper", __FILE__)

describe Album  do
  it "should be valid" do
    FactoryGirl.build(:album).should be_valid
  end

end
