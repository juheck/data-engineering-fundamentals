# Find the number of occurrences of each number in the list and store the result.

# Example 1:
# Input: [1, 2, 1, 2, 2, 5, 7]
# Output: {1: 2, 2: 3, 5: 1, 7: 1}

l = [1, 2, 1, 2, 2, 5, 7]

res = {}
for i in l:
    if i in res.keys():
        res[i] += 1
    else:
        res[i] = 1

print(res)