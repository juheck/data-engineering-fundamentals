# Given a list of numbers, return the unique values. 
# The output should be a list ordered by the first occurrence of the number.


# Example 1:
# Input: [1, 1, 1, 2, 3, 4, 4, 1]
# Output: [1, 2, 3, 4, 5]


# Example 2:
# Input: [1, 7, 2, 9]
# Output: [1, 7, 2, 9]


input = [1, 1, 1, 2, 3, 4, 4, 1]
output = []
elem_dict = {}

for e in input:
    if e not in elem_dict.keys():
        output.append(e)
        elem_dict[e] = 1

print(output)
