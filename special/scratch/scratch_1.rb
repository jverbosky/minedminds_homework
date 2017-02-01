letters = ["a", "b", "c", "d", "e"]
letter = "b"

# numbers.each do |number|
#   if number == 3
#     numbers.rotate!(number)
#   end
# end

# letters.insert(-1, "f")
# print letters
# print "\n"

# print letters.index("b")

# letters.delete_at(letter)

letters.each do |letter|
  if letter == "c"
    position = letters.index(letter)
    letters.insert(-1, letters.delete_at(position))
  end
end

print letters