require 'helper'

class TestSalty < Test::Unit::TestCase
  context "test salt" do
    setup do
      @salt = generate_salt
    end

    should "hash the same string and ensure the hash is the same" do
      assert_equal salted_hash("bobby",@salt), salted_hash("bobby",@salt)
    end
  end
end
