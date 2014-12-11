ios-dispatch-once
=================

Benchmarking creation of strings and dictionaries using different methods.

10 million iterations each

Output:
```
start timing
finished static dict in 0.225098 sec
finished dict create in 4.766281 sec
finished static string in 0.217689 sec
finished string create in 0.037064 sec
finished string reference in 0.033578 sec
```

###Results:

* ~22 times faster to do dispatch_once an unchanging dictionary
* 5.864 times SLOWER to dispatch_once a string
* 11% slower to use a global static string instead of a new string on the stack
