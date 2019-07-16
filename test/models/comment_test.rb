require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = Comment.new(comment: "This is a comment", user_id: 1)
  end

  test "Comment must have a user associated" do
    assert @comment.user_id != nil, "Expected user_id not to be nil"
  end

  test "Comment should not be empty" do
    assert @comment.comment != nil, "Expected comment not to be nil"
  end
  # test "the truth" do
  #   assert true
  # end

end
