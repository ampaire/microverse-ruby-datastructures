# frozen_string_literal: true

require 'set'

module Prime
  def self.sieve_of_eratosthenes(number, primes = (2..number).to_a, prime = 2)
    composites = []
    primes.each { |i| composites << i if (i % prime).zero? && i != prime }
    primes -= composites
    prime = primes.select { |i| i > prime }.first
    return primes if prime.nil?

    sieve_of_eratosthenes(number, primes, prime)
  end

  TO_TEN_THOUSAND = Set.new(sieve_of_eratosthenes(10_000))
end

def prime_prime(array)
  # write your code here
  hash = Hash.new(0)
  array.each do |number|
    Prime::TO_TEN_THOUSAND.each do |prime|
      break if prime > number

      hash[prime] += 1 if (number % prime).zero?
    end
  end

  hash.key(hash.values.max)
end
