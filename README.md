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

```python
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

```list[start:] 
```
: means all numbers greater than start uptil the range

```list[:end]
```
: means all numbers less than end uptil the range

```list[:] 
```
: means all numbers within the range