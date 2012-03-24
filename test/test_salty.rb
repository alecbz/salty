require 'helper'

def random_string
  generate_salt
end

class TestSalty < Test::Unit::TestCase
  context "test salt" do
    should "basic" do
      salt = generate_salt
      hashed = salty("bob",salt)
    end

    should "hash equality" do
      str = random_string
      salt = generate_salt

      assert_equal salted_hash(str,salt), salted_hash(str,salt)
    end

    should "hash equality method" do
      str = random_string
      salt = generate_salt

      hashed = salted_hash(str,salt)
      assert salty_eq(str,hashed,salt)
    end
  end
end
