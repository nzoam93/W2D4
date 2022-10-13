# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
# def for_one_word_all_vowel_pairs(word)
#     vowels = "aeiou"
#     vowel_count = Hash.new{|hash, k| hash[k] = []}
#     word.each_char do |char|
#         vowel_count[word] << char if vowels.include?(char)
#     end
#     return vowel_count
# end

# def all_vowel_pairs(words)
#     vowels = "aeiou"
#     vowel_pairs = []
#     return_arr = []
#     words.each do |word|
#         vowel_pairs << for_one_word_all_vowel_pairs(word)
#     end
#     vowel_pairs.each do |word_hash| #key, value pairs
#         word_hash.each do |word, vowel_chars|

#         end
#     end
#     return vowel_pairs
# end

def all_vowel_pairs(words)
    word_pairs = []
    vowels = "aeiou"
    vowels_arr = vowels.split("")
    words.each.with_index do |word_1, index_1| #since we have pairs, let's do TWO loops nested inside each other
        words.each.with_index do |word_2, index_2|
            pair = word_1 + " " + word_2
            word_pairs << pair if vowels_arr.all?{|vowel| pair.include?(vowel)} && index_1 <= index_2
        end
    end
    return word_pairs
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any?{|factor| num % factor == 0} #well, at least this is easy
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    # new_arr = []
    # str.each_char.with_index do |char, i|
    #     bigrams.each do |bigram|
    #         new_arr << bigram if bigram.include?(str[i..i+1])
    #     end
    # end
    # return new_arr
    # bigrams.select{|bigram| str.include?(bigram)} #one-liner
    bigram_arr = []
    bigrams.each do |bigram|
        bigram_arr << bigram if str.include?(bigram)
    end
    return bigram_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        if prc == nil
            self.select{|k,v| k == v}
        else
            self.select{|k,v| prc.call(k,v)}
        end
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings_arr = []

        if length == nil
            self.each_char.with_index do |char, index_init|
                self.each_char.with_index do |char, index_end|
                    substring = self[index_init..index_end]
                    substrings_arr << substring if substring.length != 0
                end
            end
            return substrings_arr
        end



        # restriction = false
        # restriction = true if length == nil
        self.each_char.with_index do |char, index_init|
            self.each_char.with_index do |char, index_end|
                substring = self[index_init..index_end]
                substrings_arr << substring if length == substring.length
            end
        end
        return substrings_arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        new_str = ""
        arr = self.split("")
        alphabet = ("a".."z").to_a
        arr.map do |char|
            alphabet_i = alphabet.find_index(char)
            char = alphabet[(alphabet_i + num) % 26]
            new_str += char
        end
        return new_str
    end
end
