require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "should not create comment without commenter" do
    # comment = Comment.create(body: "Test body.") # another way option
    comment = Comment.new
    comment.body = "Test body."
    assert_not comment.save
  end

  test "should not create comment without body" do
    comment = Comment.new
    comment.commenter = "Testcommenter"
    assert_not comment.save
  end

end
