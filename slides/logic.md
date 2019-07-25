## Formal logic

<br>

+++

The mathematical discipline of formal logic in 4 easy steps
<br>

  1. Distill problem to notation
  2. Apply rules of inference
  3. ???
  4. ~~Profit~~ Proof!

+++

# C+

+++

>If it is raining, then it's cloudy.

`$P \implies Q$`

+++

>It is raining.

`$P$`

+++

>Therefore, it's cloudy.

`$\therefore Q$`

+++

Intuitively, we understand this **argument** is **valid**

+++

The mathematical **discipline** of formal logic
<br>

  1. Distill problem to notation
  2. Apply rules of inference
  3. ???
  4. ~~Profit~~ Proof!

+++

**Predicate logic** introduces a few more important concepts

+++

### Universal Quantification

>For all `$x$`

`$$\forall x$$`

+++

### Existential Quantification

>There exists some `$x$`

`$$\exists x$$`

+++

### Predicates

>`$x$` is `$C$`ool

`$$Cx$$`

>`$x$` is `$A$`djacent to `$y$`

`$$Axy$$`

+++

Notice the prefix notation

+++

Using these constructs of predicate logic we can start to model the real world in logic

+++

>The `$e$`nglishman `$L$`ives in the `$r$`ed house

`$$Ler$$`

+++

Finally, we can also combine **quantifiers** and **predicates**

>There exists some `$x$` such that `$x$` `$L$`ives in the `$r$`ed house

`$$\exists x Lxr$$`

+++

We are ready to write our first prolog program!