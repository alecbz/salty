require 'pbkdf2'

module Salty

  SALT_LENGTH=30
  ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a

  def Salty.generate_salt
    (1..SALT_LENGTH).map{ALPHA.sample}.join
  end

  def Salty.salted_hash(str,salt)
    pbkdf2 = PBKDF2.new(:password => str, :salt => salt, :iterations => 1000)
    pbkdf2.hex_string
  end

  def Salty.hash(str)
    salt = generate_salt

    res = salted_hash(str,salt)

    n = str.length
    res[0...n] + salt + res[n..-1]
  end

  def Salty.check(unhashed,hashed)
    begin 
      n = unhashed.length
      salt = hashed[n,SALT_LENGTH]
      myhashed = hashed[0...n] + hashed[n+SALT_LENGTH..-1]

      return myhashed == salted_hash(unhashed,salt)
    rescue
      return false
    end
  end

end
