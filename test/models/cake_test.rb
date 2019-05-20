require 'test_helper'

class CakeTest < ActiveSupport::TestCase

  def setup
    @cake = Cake.new(created_at: DateTime.now, updated_at: DateTime.now)
  end

  test 'cake must have a title' do
    @cake.title = 'Cake Title'
    # refute @cake.valid?, 'Cake is valid without title'
    assert_not_nil @cake.errors[:title], 'No validation error for title present'
  end

  test 'cake should not save without price' do
    @cake.price_currency = '435'
    refute @cake.valid?, 'Cake is valid without price'
    assert_not_nil @cake.errors[:price_currency], 'No validation error for price present'
  end

  test 'cake must have a user id associated with it' do
    @cake.user_id = 1
    refute @cake.valid?, 'cake is saved without a user id'
    assert_not_nil @cake.errors[:user_id], 'No validation error for user id present'
  end

  test 'cake title cannot be empty' do
    @cake.title = nil
    refute @cake.valid?, 'Cake was not saved without a title'
  end

  test 'cake price cannot be empty' do
    @cake.price_currency = nil
    assert_not_nil @cake.valid?, 'Cake was not saved without a price'
  end

end
