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