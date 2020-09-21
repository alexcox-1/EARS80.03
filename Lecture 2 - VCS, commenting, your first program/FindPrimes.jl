## --- Find the first N primes

"""
```julia
findprimes(N)
```
Returns an array containing the first `N` primes.

This function uses a few diffent math tricks speed things up:
1) Since any factorization `n == a * b`, if `a > sqrt(n)` then `b < sqrt(n)`
   so we only need to check numbers up to size `a == b == sqrt(n)`
2) We only need to check prime factors, since any non-prime factor
   can in turn be resolved into prime factors
3) 2 is the only even prime, so may as well not even check other
   even numbers after 2.
"""
function findprimes(N)
    # Allocate an array to hold our primes
    primes = Array{Int64}(undef,N)
    primes[1] = 2 # The first (and only even) prime
    i = 1 # Index for the array of primes
    l = 1 # Index for first prime larger than sqrt(number)
    number = 3
    while i < N
        # Increment l if primes[l] < sqrt(number)
        if (primes[l]*primes[l] < number) && (l+1 < i)
            l += 1
        end
        # Check if our number is divisible by one of our primes.
        # Note that we don't check if it's divisible by two,
        # since we're only looking at odd numbers now.
        isprime = true
        @inbounds for k = 2:l
            if number % primes[k] == 0
                isprime = false
                break
            end
        end
        # If we hasn't found any divisors yet, it must really be prime!
        if isprime
            i += 1
            primes[i] = number
        end
        # Increment by 2, since we're only checking odd numbers now
        number += 2
    end
    return primes
end

## ---

N = 10^6
@time primes = findprimes(10^6)


## ---
