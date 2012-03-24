require 'helper'

def random_string
  Salty.generate_salt
end

class TestSalty < Test::Unit::TestCase
  context "test salt" do
    should "hash equality" do
      10.times do
        str = random_string

        hashed = Salty.hash(str)
        assert Salty.check(str,hashed)
      end
    end

    should "hash inequaliy" do
      10.times do
        str = random_string
        hashed = Salty.hash(str)

        other = random_string
        assert(other == str || (not Salty.check(other,hashed)))
      end
    end
  end
end
