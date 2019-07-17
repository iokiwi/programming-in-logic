## Prolog

<br><br>
Programs consist of

**facts** and **rules**

Generically, these are referred to as **clauses**

+++

Our first **fact**
<br>
<br>

```
human(simon).
```

>`$s$`imon is `$H$`uman

`$$Hs$$`

+++

Our first **query**

<br>

 - **queries** start with `?-`
 - evaluated as **True**, or **False**

<br>

```
?-human(simon).
True
```

+++

Using **variables** in our **queries**
<br>
<br>
```
?-human(X).
```

>Does there exist some `$x$` such that `$x$` is `$H$`uman?

`$$\exists x Hx$$`

+++

Prolog look through **facts** it knows about for one that makes the query **True**

+++

Yes! 

```
?-human(X).
X=simon
```

>`$s$`imon is `$H$`uman

`$$Hs$$`

+++

## Family trees

>The FizBuzz of Prolog

+++

```prolog
father(jamie, tommen).
father(jamie, myrcella).
father(jamie, joffrey).
```

```prolog
mother(cersei, tommen).
mother(cersei, myrcella).
mother(cersei, joffrey).
```

+++

```
?-father(X, tommen)
X=Jamie
```

+++

```
?-father(jamie, Y)
Y=tommen
Y=myrcella
Y=joffrey
```
+++

```prolog
?-father(X, Y)
X=jamie, Y=tommen
X=jamie, Y=myrcella
X=jamie, Y=joffrey
```

+++

We could go further and define some sibling facts

<br>
<br>
```prolog
sibling(tommen, myrcella).
sibling(tommen, joffrey).
sibling(joffrey, myrcella).
```

+++

Not elegant nor scalable. 

<br>

`$$ R = (\frac{n^2}{2}) - n$$`

<br>


There has to be a better way...

+++

## Rules

Specify relationships between facts

+++

>`$X$` and `$Y$` are siblings if `$X$` and `$Y$` share a mother or a father

```
sibling(X, Y) :- 
    mother(Z, X),
    mother(Z, Y),
    X \== Y.

sibling(X, Y) :- 
    father(Z, X),
    father(Z, Y),
    X \== Y.
```

+++

```
?- sibling(X, Y).
X = tommen, Y = myrcella
X = tommen, Y = joffrey
X = myrcella, Y = tommen
```

+++

More relations...
<br><br>
```
uncle_or_aunt(X, Y) :- 
    mother(M, Y),
    sibling(M, X).

uncle_or_aunt(X, Y) :- 
    father(M, Y),
    sibling(X, M).
```
```
father(tywin, jamie).
father(tywin, cersei).
father(tywin, tyrion).
```

+++

```
?- uncle_or_aunt(X ,Y).
X = jamie, Y = tommen
X = tyrion, Y = tommen
X = jamie, Y = myrcella
X = tyrion, Y = myrcella
X = jamie, Y = joffrey
X = tyrion, Y = joffrey
X = cersei, Y = tommen
X = tyrion, Y = tommen
X = cersei, Y = myrcella
X = tyrion, Y = myrcella
X = cersei, Y = joffrey
X = tyrion, Y = joffrey
```

+++

## Lists and some operations

<br>

`[1, 2, 3]`

`[one, two , three]`

+++

#### Referencing items in lists

<br>
<br>

`[ F | R ]`

>The first part of the list, and the rest of the list

+++

`[a, b, c]`

<br>

Then `[ F | R ]` equates to

<br>

`F=a`, `R=[b, c]`

+++

#### The `append` clause

<br>

Prolog has a usefull clause for appending to as list.

<br>

`append(A, B, C)`

<br>
```
?-append([1], [2, 3], C)
C=[1, 2, 3]
```

+++

`append` is nothing more than a clause

>Succeeds if `C` is the result of appending `B` to `A`

+++

Prolog is working out the value(s) for `C` which make the append() clause **True**

+++

So, because this is prolog,

we can do this

```
?-append([1], B, [1, 2, 3]).
B=[2,3]
```

and this

```
?-append(A, B, [1, 2, 3]).
A = [],        B = [1, 2, 3]
A = [1],       B = [2, 3]
A = [1, 2],    B = [3]
A = [1, 2, 3], B = []
```

+++

###  The "Don't care" variable

<br>

<span style="font-size='1000px'">_</span>

>Used like a variable but it tells prolog we **dont care** what it's value is.

+++


`[a, b, c]`

<br>

Then `[F|_]` equates to

<br>

`F=a`, we **dont care** about the rest

+++

###  Solving Einsteins Riddle

+++

<small>
There are five houses.<br>
The Englishman lives in the red house.<br>
The Spaniard owns the dog.<br>
Coffee is drunk in the green house.<br>
The Ukrainian drinks tea.<br>
The green house is immediately to the right of the ivory house.<br>
The Old Gold smoker owns snails.<br>
Kools are smoked in the yellow house.<br>
Milk is drunk in the middle house.<br>
The Norwegian lives in the first house.<br>
The man who smokes Chesterfields lives in the house next to the man with the fox.<br>
Kools are smoked in the house next to the house where the horse is kept.<br>
The Lucky Strike smoker drinks orange juice.<br>
The Japanese smokes Parliaments.<br>
The Norwegian lives next to the blue house.
</small>

Who owns the zebra and who drinks water?

+++

Each house has 5 properties

 * The nationality of the **Owner**
 * The **Pet**
 * The **Cigarret** brand
 * The **Drink**
 * The **Color**

+++

A **fact** for houses

```
house(Owner, Pet, Cigarette, Drink, Color)
```

+++

### The `houses` rule

<br>

Succeeds when `$H$` is a list of 5 **facts** which, collectively, satisfy requirements 2 - 15

<br>

```
houses(H) :-
    % There are 5 houses, 
	% The Englishman lives in the red house,
    % The Spaniard owns the dog,
```

+++

We can start building up facts about the houses piece by piece

We'll use the **dont care** variable where information is not provided

+++

>there are 5 houses

```
houses(H) :-
    length(H, 5),
    ...
```

Suceeds if `|$H$| = 5`

+++

>The **Englishman** lives in the **red** house.

```
houses(H) :-
    ...
    member(house(englishman,_,_,_,red), H),
    ...
```

+++

>The **Spaniard** owns the **dog**.

```
houses(H) :-
    ...
    member(house(spaniard,dog,_,_,_), H),
    ...
```

+++

>**Coffee** is drunk in the **green** house.

```
houses(H) :-
    ...
    member(house(_,_,_,coffee,green), H),
    ...
```
+++

>The **Ukrainian** drinks **tea**

```
houses(H) :-
    ...
    member(house(ukrainian,_,_,tea,_), H),
    ...
```

+++

>The **green** house is immediately to the right of the **ivory** house.

We need a **rule** to determine which houses are next to one another

+++


### The `next(A, B)` clause

Houses `$A$` and `$B$` are next to each other if


`$A$` is next to `$B$`

```
next(A, B, L) :-
    append(_, [A,B|_], L).
```

Or if `$B$` is next to `$A$`

```
next(A, B, L) :-
    append(_, [B,A|_], L).
```
+++

>The **green** house is immediately to the right of the **ivory** house.

```
houses(H) :-
    ...
    next(house(_,_,_,_,ivory),house(_,_,_,_,green), H),
    ...
```

+++

>The **Old Gold** smoker owns **snails**.

```
houses(H) :-
    ...
    member(house(_,snails,gold,_,_), H),
    ...
```

+++

>**Kools** are smoked in the **yellow** house.

```
houses(H) :-
    ...
    member(house(_,_,kools,_,yellow), H),
    ...
```

+++

>**Milk** is drunk in the **middle house**.

```
houses(H) :-
    ...
    H = [_,_,house(_,_,_,milk,_),_,_],
    ...
```

+++

>The **Norwegian** lives in the **first house**.

```
houses(H) :-
    ...
    
    H = [house(norwegian,_,_,_,_)|_],
    ...
```

+++

>The man who smokes **Chesterfields** lives in the house next to the man with the **fox**.

```
houses(H) :-
    ...
    
    next(house(_,fox,_,_,_), house(_,_,chesterfield,_,_), H),
    ...
```

+++

>**Kools** are smoked in the house next to the house where the **horse** is kept.

```
houses(H) :-
    ...
    
    next(house(_,_,kools,_,_), house(_,horse,_,_,_), H),
    ...
```
+++

>The **Lucky Strike** smoker drinks **orange juice**.

```
houses(H) :-
    ...
    
    member(house(_,_,lucky,juice,_), H),
    ...
```

+++

>The **Japanese** smokes **Parliaments.**

```
houses(H) :-
    ...
    member(house(japanese,_,parliaments,_,_), H),
    ...
```

+++

>The **norwegian** lives next to the **blue** house

```
houses(H) :-
    ...
    next(house(norwegian,_,_,_,_), house(_,_,_,_,blue), H).
    ...
```

+++

### The Zebra Owner Rule

<br>

Succeeds when some list `$H$` meets all of the 15 criteria
and, contains a house with a zebra.

<br>


```
zebra_owner(O) :-
	houses(H),
	member(house(O,zebra,_,_,_), H).
```

+++

No facts explicitly match **Zebra**

But this rule will also match any facts with no pet value.

+++

There was only one

<br>
<br>


```
?-zebra_owner(O).
O=japanese
```

>The **Japanese** man owns the **Zebra**

+++

### The Water Drinker rule

<br>

Succeeds when some list `$H$` meets all of the 15 criteria
and, contains a house where water is drunk.

<br>

```
water_drinker(D) :-
	houses(H),
	member(house(D,_,_,water,_), H).
```

+++

Like the Zebra rule, this rule will match any facts with no **Drink** value.

+++

There was only one
<br>
<br>
```
?-water_drinker(D).
D=norwegian
```

>The **Norwegian** man drinks the **Water**

+++
