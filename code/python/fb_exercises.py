# 1. Write a function to return the number of times a character appears in a string. The character can be the empty string.

s1='missisipi'
res=[]

for i in range(len(s1)):
    #print(s1[i])
    if s1[i]=='s':
        res.append('s')
print(len(res))


# 2. Given an array containing None values fill in the None values
# with most recent non None value in the array
# For example:
# - input array: [1,None,2,3,None,None,5,None]
# - output array: [1,1,2,3,3,3,5,5]
# [None]
# [None,1,2] ==> [None,1,2]
# [1,None,2] ==> [1,2,2]
# [1,4,None,None,3]===> [1,4,4,4,3]

arr=[None,1,2,None]
new_l=[]
for i in range(0,len(arr)):
    if arr[i] != None:
        new_l.append(arr[i])
    else:
        new_l.append(arr[i-1])

print(new_l)



# 3. Given two sentences, construct an array that has the words that appear in one sentence and not the other.
# For example:
# - string 1 : "Firstly this is the first string"
# - string 2 : "Next is the second string" 
# - output : ['Firstly', 'this', 'first', 'Next', 'second']

A = "Geeks for Geeks"
B = "Learning from Geeks for Geeks"
d={}
for w in A.split():
    if w in d:
        d[w]=d.get(w,0)+1
    else:
        d[w]=1
for w in B.split():
    if w in d:
        d[w]=d.get(w,0)+1
    else:
        d[w]=1
    unmatchedW=[w for w in d if d[w]==1]
print (unmatchedW)


# 4. Calculate the average word length.
# For the given set of words return the average word length.

sentence = "Hi my name is Bob"
words = sentence.split()
print(words)
average=1.0* sum(len(word)for word in words)/len(words)
print(average)


# 5. Given a list of ints, balance the list so that each int appears equally in the list. 
# Return a dictionary where the key is the int and the value is the count needed to balance the list.
# [1, 1, 2] => {2: 1}
# [1, 1, 1, 5, 3, 2, 2] => {5: 2, 3: 2, 2: 1}

l_int = [1, 1, 1, 5, 3, 2, 2]
d_int = {}
max = 0

for i in l_int:
    if d_int.get(i) == None:
        d_int[i] = 1
        if max < d_int[i]:
            max = d_int[i]
    else:
        d_int[i] += 1
        if max < d_int[i]:
            max = d_int[i]

res = {}
for key, value in d_int.items():
    if value != max:
        res[key] = max - d_int[key]

print(res)


# 6. Given an array of integers, we would like to determine whether the array is monotonic (non-decreasing/non-increasing) or not.
# Examples:
# 1 2 5 5 8 --> true
# 9 4 4 2 2 --> true
# 1 4 6 3 --> false
# 1 1 1 1 1 1 --> true

def is_monotonic(nums):
    inc = 0
    dec = 0
    for idx in range(1,len(nums)):
        if nums[idx] > nums[idx-1]:
            inc += 1
        elif nums[idx] < nums[idx-1]:
            dec += 1
    return (inc == 0 or dec == 0)


# 7. Given an ip address as an input string, validate it and return True/False

def validate(ip):
    #valid_digit=set('0123456789')
    a=ip.split('.')
    if len(a)!=4:
        return False
    for x in a:
        if not x.isdigit():
            return False
        i=int(x)
        if i < 0 or i> 255:
            return False
    return True
print(validate('127.0.0.b'))
