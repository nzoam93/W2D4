def no_dupes?(arr)
    new_arr = []
    count = Hash.new(0)
    arr.each do |ele|
        count[ele] += 1
    end
    count.each do |k,v|
        new_arr << k if v == 1
    end
    new_arr

    # count = Hash.new(0)
    # arr.each {|ele| count[ele] += 1}
    # count.keys.select{|el| count[el] == 1}
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    return true
end

def char_indices(str)
    character_hash = Hash.new{|hash,k| hash[k] = []}
    str.each_char.with_index do |char, i|
        character_hash[char].append(i)
    end
    return character_hash
end

def longest_streak(str) #wow, what a way!
    new_str = ""
    (0...str.length - 1).each do |i|
        if str[i] == str[i+1]
            new_str += str[i]
        else
            new_str += str[i] + " "
        end
    end
    new_str += str[-1]
    arr = new_str.split(" ")
    return arr.max
end

def prime?(num)
    return false if num < 2
    return (2...num).none?{|factor| num % factor == 0}
end


def bi_prime?(num)
    factors = []
    (2...num).each do |factor|
        factors << factor if num % factor == 0
    end
    prime_factors = factors.select{|ele| prime?(ele)}
    prime_factors.each do |factor_1|
        prime_factors.each do |factor_2|
            return true if factor_1 * factor_2 == num
        end
    end
    return false
end

def caesar_cipher_for_char(char, num)
    return " " if char == " "
    alphabet = ("a".."z").to_a
    alphabet_i = alphabet.find_index(char)
    new_char = alphabet[(alphabet_i + num) % 26]
    return new_char
end

def vigenere_cipher(message,keys) #bam! Woohoo
    new_str = ""
    space_accounter_for = 0 #is used so that the index still correctly grabs the character even if there was a space!
    message.each_char.with_index do |char,i|
        space_accounter_for -= 1 if char == " "
        key_index = keys[(i+ space_accounter_for) % keys.length ]
        new_str += caesar_cipher_for_char(char,key_index)
    end
    return new_str
end

def vowel_rotate(str)
    vowels = "aeiou"
end

#proc problems

class String
    def select(&blc)
        new_str = ""
        if blc != nil
            self.each_char do |char|
                new_str += char if blc.call(char)
            end
        end
        return new_str
    end

    def map!(&blc)
        self.each_char.with_index do |char,index|
            self[index] = blc.call(char,index)
        end
        return self
    end
end

#recursion problems
def multiply(a,b) #hmmm, interesting
    return a if b == 1
    return -a if b == -1
    if b < 0
        return -a + multiply(a,b+1)
    end
    if b > 0
        return a + multiply(a, b-1)
    end
end

def lucas_number(n)
    return 2 if n == 0
    return 1 if n == 1
    return lucas_number(n-2) + lucas_number(n-1)
end

def lucas_sequence(num)
    sequence = []
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2

    arr = lucas_sequence(num - 1) #I can save the result as a variable
    return arr << (arr[-2] + arr[-1])
    #saving a variable to recursive function: memoization
    #makes it easier to read and saves memory by saving it as arr
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization_non_recursive(num)
    prime_factors = []
    return [num] if prime?(num)
    while !prime?(num)
        (2..num).each do |factor|
            if num % factor == 0
                prime_factors << factor
                num /= factor
                break
            end
        end
    end
    prime_factors << num
    return prime_factors
end

def prime_factorization(num)
    return [num] if prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            smaller_factor = num / factor
            # return [prime_factorization(factor).concat(prime_factorization(smaller_factor)]).flatten
            return [*prime_factorization(factor), *prime_factorization(smaller_factor)] #doesn't require flatten
        end
    end
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
