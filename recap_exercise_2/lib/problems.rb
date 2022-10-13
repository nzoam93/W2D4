# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (num_1..(num_1*num_2)).each do |multiple|
        return multiple if multiple % num_1 == 0 && multiple % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)
    str.each_char.with_index do |char,i| #technically better to do (0...str.length -1).each. That way, it doesn't grab the last character. and I am not storing a random char varialbe
        bigram = str[i..i+1]
        count[bigram] += 1
    end
    sorted_arr = count.sort_by {|k,v| v} #have to actually save it to a variable in order to grab it later
    return sorted_arr[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        # keys = []
        # vals = []
        # self.each do |k, v|
        #     keys << v
        #     vals << k
        # end
        # keys.each.with_index do |key, index|
        #     new_hash[key] = vals[index]
        # end
        self.each do |k,v|
            new_hash[v] = k
        end
        return new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |ele_1, index_1|
            self.each.with_index do |ele_2, index_2|
                pair = ele_1 + ele_2
                count += 1 if pair == num && index_1 < index_2
            end
        end
        return count

    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        # if prc == nil
        #     (0...self.length - 1).each do |i|
        #         (0...self.length - 1).each do |j|
        #             self[j],self[j+1] = self[j+1],self[j] if self[j] > self[j+1]
        #         end
        #     end
        #     return self
        # end

        # (0...self.length - 1).each do |i|
        #     (0...self.length - 1).each do |j|
        #         if prc.call(self[j],self[j+1]) == -1
        #             self[j],self[j+1] = self[j],self[j+1]
        #         elsif prc.call(self[j],self[j+1]) == 1
        #             self[j],self[j+1] = self[j+1],self[j]
        #         end
        #     end
        # end
        # return self
        #my way works, but Alvin's is neater!


        #prc = whatever prc it was given, OR if it's nil, define it as the following
        prc ||= Proc.new{|a,b| a <=> b}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i],self[i+1]) == 1
                    sorted = false #I know this because I just had to sort things
                    self[i],self[i+1] = self[i+1],self[i]
                end
            end
        end
        return self

    end
end
