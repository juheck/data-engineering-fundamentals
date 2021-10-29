# Given a string s, find the length of the longest substring without repeating characters.


# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.


# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.


# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


# Example 4:
# Input: s = ""
# Output: 0


s = "abcabcbb"

def longest_substr(s):
    last_idx = {}
    max_len = 0

    start_idx = 0

    for i in range(len(s)):
        print("Loop {}".format(str(i)))
        # Find the last index of s[i]
        # Update start_idx (starting index of current window)
        # as maximum of current value of start_idx and last index plus 1
        if s[i] in last_idx:
            print(s[i])
            print(start_idx)
            print( last_idx[s[i]] + 1)
            start_idx = max(start_idx, last_idx[s[i]] + 1)
        
        # update results if we get a larger window
        max_len = max(max_len, i-start_idx + 1)

        # update last index of current char
        last_idx[s[i]] = i

    return max_len

res = longest_substr(s)

    
