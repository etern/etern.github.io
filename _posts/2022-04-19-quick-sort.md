---
title: quick sort
date: 2022-04-19 16:50:05 +0800
---
When haskellers say they can implement quick sort in just 2 loc:

``` haskell
qsort [] = []
qsort (x:xs) = qsort [a | a <- xs, a <= x] ++ [x] ++ qsort [a | a <- xs, a > x]
```

Pythoner smiles:

``` python
def def qsort(x=[], *xs):
    return x and (qsort(*[a for a in xs if a < x]) + [x] + qsort(*[b for b in xs if b >=x]))
# x != 0, call with param destructuring: qsort(*[3, 1, 2])
```

For linked list sort, we don't have to do inplace swaping, this is
alright. Argument destructuring is used to imitate haskell pattern
matching, and here is a real pattern matching version (py3.10):

``` python
def qsort(xs):
    match xs:
        case []:
            return []
        case [x, *rest]:
            return qsort([a for a in rest if a < x]) + [x] + qsort([b for b in rest if b >=x])
```

Still concise, power of multi paradigm language!
