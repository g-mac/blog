require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "should not save article without title" do
    article = Article.new
    article.text = "This is an example text."
    assert_not article.save
  end

  test "should not save article wiht title shorter than 5 chars" do
    article = Article.new
    article.title = "T"
    article.text = "This is an example text."
    assert_not article.save
  end

  test "should not save article without text" do
    article = Article.new
    article.title = "Title"
    assert_not article.save
  end

  test "should not save article wiht text shorter than 10 chars" do
    article = Article.new
    article.title = "Title"
    article.text = "ShortText"
    assert_not article.save
  end

end
