require 'set'

# Returns the shortest substring's length that contains all unique characters
# of str e.g. length = shortest_substring(s).
def shortest_substring(str)
  raise 'str must be > 1 and < 105' unless str.size.between?(2, 104)
  raise 'str must be ASCII[a-z]' unless str.match?(/^[a-z]+$/)

  chars = Set.new(str.chars)
  matches = {}

  substring = str.dup
  while match = find_match(substring, chars)
    matches[match.size] = match
    substring.gsub!(match, '')
  end

  matches.keys.sort.first
end

### Helper Functions ###

# Returns the first substring found (containing all chars in any order).
# Starts with chars.size and adds a character until the full substring is built.
def find_match(substring, chars)
  i = (chars.size - 1)

  while i <= substring.size
    s = substring[0..i]
    return shrink_match(s, chars) if match?(s, chars)

    i += 1
  end

  nil
end

# Returns match or a substring thereof, by attempting to match against chars while
# removing one character at a time from the start of str.
def shrink_match(match, chars)
  i = 1

  while i <= match.size
    s = match[i..-1]
    break if s.size < chars.size

    return s if match?(s, chars)

    i += 1
  end

  match
end

# Returns true if str contains all chars in any order.
def match?(str, chars)
  chars.subset?(Set.new(str.chars))
end
