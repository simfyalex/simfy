require File.expand_path("../../spec_helper", __FILE__)

describe Artist  do
  it "should be valid" do
    FactoryGirl.build(:artist).should be_valid
  end

end
