require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it "1) should create a tag with the following information" do
    tag = Tag.new(:name => "Alert")
    expect(tag.class).to eq(Tag)
    expect(tag.name).to eq("Alert")
    expect(tag.new_record?).to eq(true)
  end

  it "2) should validate tag is only comprised of letters" do
    tag = Tag.new(:name => "Alert!")
    expect(tag.save).to eq(false)
    expect(tag.errors.messages[:name]).to eq(["must only contain letters - no symbols"])
  end

  it "3) should validate tag is of certain length" do
    tag = Tag.new(:name => "Bo")
    expect(tag.save).to eq(false)
    expect(tag.errors.messages[:name]).to eq(["must be at least 3 charasters long"])
  end

  it "4) should validate tag is of certain length" do
    tag = Tag.new(:name => "DoubleBootyLicious")
    expect(tag.save).to eq(false)
    expect(tag.errors.messages[:name]).to eq(["must be at less than 12 charasters"])
  end


end