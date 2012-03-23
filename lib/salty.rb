require 'digest/sha1'

def hash_fn(str)
  Digest::SHA1.hexdigest str
end

def salted_hash(str,salt)
  100.times do
    str = hash_fn(str+salt)
  end
  str
end

ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a

def generate_salt(n=30)
  (1..n).map{ALPHA.sample}.join
end
