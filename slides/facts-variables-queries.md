# Facts

"A fact is an expression that makes a declarative statement about the problem domain"





+++


Assertions that we will assume hold true,
 

it may be more helpful to think of these as **assumptions**

**assumption** 

+++

`human(simon).`

_Simon is human_

+++

Or state relationships between constants

+++

`lives(wellington, simon).`

_simon_ **lives** in _wellington_

+++

# Queries

Start with `?-`

expect only two possible results **True** or **False**

+++

```
?- human(simon).
true
```

```
?- not(human(simon)).
false
```

+++

# Variables

should be thought of in terms algebraic 'variables'

+++

We don't assign values to variables.

Instead, variables act as **unknowns** or **placeholders**

+++

`?- human(simon).`

`?- human(X).`


 _Solve for **X**_

`X=simon`
+++

 
+++

X=simon

+++

+++

Prolog will try to find a value for all place holders such that the fact is true

+++

```
?- father(X, joffrey).
X = jamie
```

```
?- father(jamie, Y).
Y = joffrey
```


```prolog
% father(jamie, joffrey).
father(jamie, tommen).
father(jamie, myrcella).
mother(cersei, joffrey).
mother(cersei, tommen).
mother(cersei, myrcella).
```


We can go further and define a sibling fact

```
sibling(tommen, myrcella).
```

```
?- mother(cersei, X).
X = joffrey
X = myrcella
X = tommen
```

+++

**Sibling**

_noun_

One of two or more individuals having one or both parents in common; a brother or sister.

+++
