require File.expand_path("../../spec_helper", __FILE__)

describe Track  do
  it "should be valid" do
    FactoryGirl.build(:track).should be_valid
  end

end
