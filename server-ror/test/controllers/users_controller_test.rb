require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "first user to register should have admin rights" do
    assert (User.find(1).has_role? :admin), "Admin doesn't have admin rights"
  end

  test "second user to register should have bartender rights" do
    assert (User.find(2).has_role? :bartender), "Bartender doesn't have bartender rights"
  end
end
