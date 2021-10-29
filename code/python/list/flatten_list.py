# Given a nested list, return a flattened list with only the distinct numbers. 
# The output should be a list ordered by the first occurrence of the number.


# Example 1:
# Input: [1, 2, 3, [1, 2], [4, 5], 1]
# Output: [1, 2, 3, 4, 5]

num_dict = {}
def flatten_dedupe_list(s): 
    output = []

    for x in s:
        if isinstance(x, list):
            s_sub = flatten_dedupe_list(x)
            output.extend(s_sub)

        else:
            if x in num_dict.keys():
                pass
            else:
                num_dict[x] = 1
                output.append(x)

    return output


s = [1, 2, 3, [1, 2], [4, 5], 1]
print(flatten_dedupe_list(s))