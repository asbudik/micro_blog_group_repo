require 'rails_helper'

RSpec.describe Page, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should create page w/o saving to db" do
    newPage = Page.new(:name => "Bob")
    expect(newPage.name).to eq("Bob")
    expect(newPage.new_record?).to eq(true)
  end

  it "should validate the presence of content" do
    content = Page.new(:content => "ipsum loren loren")
    expect(content.new_record?).to eq(true)
    content.save
    expect(content.new_record?).to eq(false)
  end

  
end