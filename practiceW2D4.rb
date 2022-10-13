# def count_down(num)
#     if num == 0
#       p "Houston, we have lift-off!"
#       return;
#     end

#     p num
#     count_down(num - 1)
#   end

#   count_down(3)  # prints nums 10 -> 1. Instead of 0, it prints "Houston.."

# def factorial(n)
#     return 1 if n == 1
#     factorial(n-1) * n
# end

# p factorial(5)

# def fib(n)
#     return 1 if n == 1
#     return 1 if n == 2
#     return fib(n-2) + fib(n-1)
# end

# p fib(5)

# a = false
# b = 10
# p a || b

# def greet(person = "YOU")
#     p "Hey " + person
# end

# greet()
# greet("B")


# def call_that_proc(val, &prc)
#     prc ||= Proc.new { |data| data.upcase + "!!" }
#     prc.call(val)
# end

# p call_that_proc("hey")                                             # => "HEY!!"
# p call_that_proc("programmers") { |data| data * 3 }                 # => "programmersprogrammersprogrammers"
# p call_that_proc("code") { |data| "--" + data.capitalize + "--"}    # => "--Code--"

# class Restaurant
#     attr_reader :name, :chefs, :menu

#     def initialize(name, chefs)
#         @name = name
#         @chefs = chefs
#         @menu = ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
#     end
# end

# five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
# p five_star_restaurant

# class Restaurant
#     attr_accessor :name, :chefs, :menu

#     def initialize(name, chefs)
#         @name = name
#         @chefs = chefs
#     end

#     def menu
#         @menu ||= ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
#     end
# end

# five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])

# p five_star_restaurant
# p five_star_restaurant.menu
# p five_star_restaurant

# arr = [5,2,2]
# p arr[4..-1]

# p [12].is_a?(Array)
# p 12.is_a?(Float)
# p 12.is_a?(String)

# p '12'.is_a?(Integer)
# p '12'.is_a?(Float)
# p '12'.is_a?(String)

# p 12.0.is_a?(Integer)
# p 12.0.is_a?(Float)
# p 12.0.is_a?(String)

# arrA = [1]
# arrB = [2]
# p arrA.concat(arrB)

# arr = ["a", "c", "b"]
# p arr.sort

# self.build_stacks(num)
#         new_arr = []
#         (0..num).each do
#             new_arr << []
#         end
#         return new_arr
#     end

# alphabet = ("a".."z").to_a.join("")
# p alphabet[0..3]

# alphabet = "abcd"
# p alphabet[0..2]

a = [1,2,3,4,5]

p 2.to_s <=> 13.to_s
