# Data Structures in Python



## List

In Python, a list is an ordered sequence of heterogeneous elements. In other words, a list can hold elements with different data types. For example:

```python
list = ['a', 'apple', 23, 3.14] 
```

Lists can hold integers, strings, characters, functions, and pretty much any other data type including other lists simultaneously.
The elements can be accessed or ‘indexed’ using square brackets.


### Append()

Add a single element to the end of a list. This function works in O(1), constant time.


```python
list = [1, 3, 5, 'seven']
print(list)  # [1, 3, 5, 'seven']
list.append(9)
print(list) # [1, 3, 5, 'seven', 9]
```


### Insert()

Inserts element to the list. Use it like **_list.insert(index, value)_**. It works in O(n) time.

```python
list = [1, 3, 5, 'seven']
list.insert(0, 2)
print(list) # [2, 1, 3, 5, 'seven']
```


### Pop()

Removes the element at given index. If no index is given, then it removes the last element. 
So **_list.pop()_** would remove the last element.

```python
list = [1, 3, 5, 'seven']
print(list) # [1, 3, 5, 'seven']
list.pop(2)
print(list) #  [1, 3, 'seven']
```

### Sorted()

Sorted() sorts any sequence (list, tuple) and always returns a list with the elements in a sorted manner, without modifying the original sequence.

```
sorted(iterable, key=key, reverse=reverse)
```
| iterable | Required. The sequence to sort, list, dictionary, tuple etc.
| key | Optional. A Function to execute to decide the order. Default is None
| reverse | Optional. A Boolean. False will sort ascending, True will sort descending. Default is False

```python
# Sort a list of integers based on
# their remainder on dividing from 7
def func(x):
    return x % 7
 
L = [15, 3, 11, 7]
 
print("Normal sort :", sorted(L))
print("Sorted with key:", sorted(L, key=func))
```
```
Normal sort : [3, 7, 11, 15]
Sorted with key: [7, 15, 3, 11]
```

### Enumerate()

Enumerate() method adds a counter to an iterable and returns it in a form of enumerating object. This enumerated object can then be used directly for loops or converted into a list of tuples using the list() method.
```
enumerate(iterable, start=0)
```
| Iterable | any object that supports iteration
| Start | the index value from which the counter is to be started, by default it is 0

```python
# Python program to illustrate
# enumerate function in loops
l1 = ["eat","sleep","repeat"]
 
# printing the tuples in object directly
for ele in enumerate(l1):
    print (ele)
print
 
#getting desired output from tuple
for count,ele in enumerate(l1):
  print(count)
  print(ele)
```

```
(0, 'eat')
(1, 'sleep')
(2, 'repeat')

0
eat
1
sleep
2
repeat
```

### Slicing

In Python, we can use square brackets and a colon to define a range of elements within a list that you want to access or ‘slice’.

```
list[start:end]
```

1. Indexing elements of a list

List elements can be indexed and printed as in the following code example:

```python
list = list(range(10))
print(list)  # 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
print(list[0:4])  # 0, 1, 2, 3
```

Also, note that it is not necessary to specify the last or the first index explicitly, you can simply leave the **_end_** or **_start_** index blank respectively.

```
list[start:] : means all numbers greater than start uptil the range
list[:end] : means all numbers less than end uptil the range
list[:] : means all numbers within the range
```

2. Stepped Indexing

```
list[start:stop:step]
```

**_step_** specifies the increment in the list indices and can also be negative. For example:

```python
list = list(range(10)) # define a range of values 0
print(list[0:9:2])  # 0, 2, 4, 6, 8  
print(list[9:0:-2])  # 9, 7, 5, 3, 1
```


3. Initializing list elements

We can add/modify the contents of a list by specifying a range of elements that you want to update and setting it to the new value:

```
arr[start:end] = [list, of, New, values]
```
```python
x = list(range(5))
print(x)  # 0, 1, 2, 3, 4
x[1:4] = [45, 21, 83]
print(x)  # 0, 45, 21, 83, 4
```

4. Negative indexing

We can use negative numbers to begin indexing the list elements from the end. For example, to access the fifth-last element of a list, we use:

```
list[-5]
```
```python
list = list(range(10))
print(list)
print(list[4:-1])  # 4, 5, 6, 7, 8
```

5. Slicing in Strings

We can also use slicing techniques on strings since strings are lists of characters.

```python
my_string = "somehow"
string1 = my_string[:4]
string2 = my_string[4:]
print(string1, string2) # some how
```


### Additional List tricks

1. List transversal 

```python
range(start, stop, hop)
range(n) # [0,1,...,n-1]
range(1,n) # [1,...,n-1]
range(1,n,2) # [1,3,5,...,n-1] if n is even, or [1,3,5,...,n-2] if n is odd
range(n,-1,-1) # [n,n-1,n-2,...,0]
range(len(arr)) # Provides indices of an array arr /!\
range(len(arr)-1,-1,-1) # Provides indices of arr backwards
```

2. List as Queue

```python
arr = [1,2,3]
arr.append(x) # queue.push(x)
arr.pop(0) #queue.pop()
arr[0] #queue.peek()
```


3. List as Stack

```python
arr = [1,2,3]
arr.append(x) #stack.push(x)
arr.pop() # stack.pop()
arr[-1] # stack.peek()
```

### List Comprehensions

A list comprehension looks a bit like a for loop except the output comes first. The comprehension is contained inside brackets to remind us that it returns a list.

```
Syntax: [Output for variable in list]
Example: [x+1 for x in [1,2,3]]
Result: [2,3,4]
```

You can optionally add a filter at the end in the form of a traditional if statement. Additional syntax is also accepted for more complex comprehensions.

```
Syntax: [Output for variable in list condition]
Example: [x+1 for x in [1,2,3] if x > 1]
Result: [3,4]
```


```python
my_list = [5, 9, 2, 6, 11, 14]
my_list = [x for x in my_list if x % 2 == 0]
```
```
my_list: [2, 6, 14]
```

## Dictionaries

A dictionary in python is a mapping object that maps keys to values, where the keys are unique within a collection and the values can hold any arbitrary value. In addition to being unique, keys are also required to be hashable.

A dictionary’s data is always enclosed by a pair of curly braces **_{ }_**, and would normally look like this:

```python
my_dict = {"first_name": "John", "last_name":"Snow", "age":16, "gender":"Male"}
```

### Accessing items

To access a particular value in a dictionary we use the indexing operator (key inside square brackets). However, to use this method, we need to make sure the key we intend to retrieve exists.
But we have a better tool: the **_get()_** method. This method works by giving out a value if the key exists, or returning _None_.
```python
my_dict.get("first_name") # John
my_dict.get("salary") # None
```

### Modification

Dictionaries can be modified directly using the keys or using the **_update()_** method. **_update()_** takes in a dictionary with the key-value pairs to be modified or added.

```python
# Adding a new entry for salary using the index
my_dict["salary"] = 10000

# Modifying the entry for last_name using the index
my_dict["last_name"] = "Edwards"

# Modifying the salary entry using update
my_dict.update({"salary":20000})
```

A particularly nice use case for update() is when we need to merge two dictionaries:

```python
extra_info = {
  "verified":True,
  "qualification":"Undergraduate Degree",
  "taxable":True}

# Merge extra_info with my_dict
my_dict.update(extra_info)
```

### Deletion

Use **_del()_**

```python
del my_dict["salary"]

my_dict.clear() # returns empty dictionary
```

### Iteration

A dictionary by itself is an iterable of its keys. Moreover, we can iterate through dictionaries in 3 different ways:
- dict.values() - this returns an iterable of the dictionary's values.
- dict.keys() - this returns an iterable of the dictionary's keys.
- dict.items() - this returns an iterable of the dictionary's (key,value) pairs.

```python
my_dict = {"first_name": "John", "last_name":"Snow", "age":16, "gender":"Male"}

print(my_dict.values()) # dict_values(['John', 'Snow', 16, 'Male'])
print(my_dict.keys()) # dict_keys(['first_name', 'last_name', 'age', 'gender'])
print(my_dict.items()) # dict_items([('first_name', 'John'), ('last_name', 'Snow'), ('age', 16), ('gender', 'Male')])

for key,val in my_dict.items():
    print(key, val) #print the keys and values of item
```
```
first_name John
last_name Snow
age 16
gender Male
```

### Sorting

Calling the **_sorted()_** function and passing it a dictionary only returns a list of the keys in a sorted order, since the dictionary is an iterable of its keys.
If we use the **_items()_** iterable we could sort the items of our dictionary as we please. However, this doesn't give us our original dictionary, but a list of key-value tuples in a sorted order.

```python
my_dict = {"first_name": "John", "last_name":"Snow", "age":16, "gender":"Male"}
# Using sorted() to sort a dictionary's items on the keys
for key,val in sorted(my_dict.items(),key=lambda item:item[0]):
    print(key, val) #print the keys and values of each item
```
```
age 16
first_name John
gender Male
last_name Snow
```


## Useful string functions

### len()

### split()

### isdigit()

### upper()/lower()

