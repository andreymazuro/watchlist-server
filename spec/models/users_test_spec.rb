require "rails_helper"

RSpec.describe User, :type => :model do
  it "orders by last name" do
    andy = User.create!(name: "andy", email: "Lindeman@gmail.com", password: "123456")
    bob = User.create!(name: "bob", email: "Chelimsky@mail.ru", password: "123456")
    expect(User.order('name')).to eq([andy, bob])
  end

  it "checking email verification" do
    User.create(name: "Ondy", email: "Lindeman", password: "123456")
    expect(User.count).to eq 0
  end


  it "checking password format" do
    User.create(name: "Ondy", email: "Lindeman@mail.ru", password: "145324236")
    expect(User.count).to eq 1
  end


end
