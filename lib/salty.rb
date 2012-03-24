require 'digest/sha1'

def hash_fn(str)
  Digest::SHA1.hexdigest str
end

def salted_hash(str,salt)
  res = str
  100.times do
    res = hash_fn(res+salt)
  end
  res
end

alias :salty :salted_hash

def salty_eq(unhashed,hashed,salt)
  hashed == salted_hash(unhashed,salt)
end

ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a

def generate_salt(n=30)
  (1..n).map{ALPHA.sample}.join
end
