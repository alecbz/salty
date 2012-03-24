require 'helper'

def random_string
  generate_salt
end

class TestSalty < Test::Unit::TestCase
  context "test salt" do
    should "hash equality" do
      10.times do
        str = random_string

        hashed = salty(str)
        assert salty_eq(str,hashed)
      end
    end

    should "hash inequaliy" do
      10.times do
        str = random_string
        hashed = salty(str)

        other = random_string
        assert(other == str || (not salty_eq(other,hashed)))
      end
    end
  end
end
