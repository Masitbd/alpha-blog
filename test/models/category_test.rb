require 'test_helper'

class CategoryTest < ActiveSupport:: TestCase


    def setup
        @categoty = Category.new(name: "Sports") 
    end

    test "categoty should be valid" do 
     assert @categoty.valid?
 end

 test "name should be present" do
   @categoty.name = ""
   assert_not @categoty.valid?
 end

  test "name shouod be unique" do
    @categoty.save
    @categoty2 = Category.new(name: "Sports") 
    assert_not @categoty2.valid?
  end

  test "name should not be too long" do
    @categoty.name = "a"*26 
    assert_not @categoty.valid?
  
  end

  test "name should not be too short" do
    @categoty.name = "aa"
    assert_not @categoty.valid?
  end
end
