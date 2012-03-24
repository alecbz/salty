require 'digest/sha1'

SALT_LENGTH=30
ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a

def hash_fn(str)
  sha512 = Digest::SHA2.new(512)
  sha512.hexdigest(str)
end

def generate_salt
  (1..SALT_LENGTH).map{ALPHA.sample}.join
end

def salted_hash(str,salt)
  res = str
  100.times do
    res = hash_fn(res+salt)
  end
  res
end

def salty(str)
  salt = generate_salt

  res = salted_hash(str,salt)

  n = str.length
  res[0...n] + salt + res[n..-1]
end

def salty_eq(unhashed,hashed)
  n = unhashed.length
  salt = hashed[n,SALT_LENGTH]
  myhashed = hashed[0...n] + hashed[n+SALT_LENGTH..-1]

  myhashed == salted_hash(unhashed,salt)
end
