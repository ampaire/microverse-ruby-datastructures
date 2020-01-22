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

def number_of_primes(arr)
  # write your code here
  arr.count { |i| Prime::TO_TEN_THOUSAND.include?(i) }
end
