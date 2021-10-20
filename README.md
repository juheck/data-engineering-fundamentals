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
So list.pop() would remove the last element.

```python
list = [1, 3, 5, 'seven']
print(list) # [1, 3, 5, 'seven']
list.pop(2)
print(list) #  [1, 3, 'seven']
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

