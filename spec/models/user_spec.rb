require 'rails_helper'

RSpec.describe User, :type => :model do

   it "1) should create a user with the following information" do
    jack = User.new(:first_name => "Jack", :last_name => "Bauer", :email => "bauer@ctu.gov")
    expect(jack.class).to eq(User)
    expect(jack.first_name).to eq("Jack")
    expect(jack.last_name).to eq("Bauer")
    expect(jack.email).to eq("bauer@ctu.gov")
    expect(jack.new_record?).to eq(true)
  end

  it "2) should save the student to the database" do
    jack = Student.new(:first_name => "Jack", :last_name => "Bauer", :email => "bauer@ctu.gov")
    expect(jack.new_record?).to eq(true)
    expect(jack.save).to eq(true)
    expect(jack.new_record?).to eq(false)
  end

  it "3) should use find/set/save syntax to update firstname" do
    Student.create(:first_name => "Jack", :last_name => "Bauer", :email => "bauer@ctu.gov")
    jack = Student.find_by_first_name("Jack")
    jack.first_name = "Enis"
    expect(jack.save).to eq(true)

    enis = Student.find_by_first_name("Enis")
    expect(jack.id).to eq(enis.id)
  end

  it "4) should validate uniqueness on student's email" do
    jack = Student.new({first_name: "Jack", last_name: "Bauer", email: "bauer@ctu.gov"})
    geraldine = Student.new({first_name: "Geraldine", last_name: "Bauer", email: "bauer@ctu.gov"})
    expect(me.save).to eq(true)
    expect(you.save).to eq(false)
    expect(you.errors.messages[:email]).to eq(["has already been taken"])
  end
end
