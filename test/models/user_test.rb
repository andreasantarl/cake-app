require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new
   end

  test 'user should not save without email' do
    @user.email = 'andrea.santarl@gmail.com'
    refute @user.valid?, 'User is valid without email'
    assert_not_nil @user.errors[:email], 'No validation error for email present'
  end

end
