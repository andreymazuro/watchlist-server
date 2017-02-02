require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user with wrong e-mail" do
  user = User.create(
    name: "Vasya",
    email: "asff@gma",
    password: "123456"
  )
  assert_not user.save
  end

  test "should save user with wright e-mail" do
  user = User.create(
    name: "Vasya",
    email: "asff@gmail.com",
    password: "123456"
  )
  assert user.save
  end

  test "testing user creation"  do
    user = User.create(
      name: "Vasya",
      email: "asff@gmail.com",
      password: "123456"
    )

    user1 = User.create(
      name: "Vasyan",
      email: "asfnf@gmail.com",
      password: "123456"
    )

    user2 = User.create(
      name: "Vasyan",
      email: "asfkf@gmail.com",
      password: "123456"
    )

    user3 = User.create(
      name: "Zanya",
      email: "asff@gmail.com",
      password: "123456"
    )

    assert_not_includes(User.all,user2, "prevent from adding user with exiscting name")
    assert_not_includes(User.all,user3, "prevent from adding user with exiscting e-mail")

  end

end
