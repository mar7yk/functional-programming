# Task 1

We call a nondeterministic finite automaton N an ordered quad (Q, q~0~. T. F), where Q is a finite set of states, q~0~ ∈ Q is an initial state, T ⊆ Q x {a, b) x Q is a set of transitions, and F ⊆ Q a set of final states.

Implement a function rejectedWord that returns any word NOT recognized by a given automaton, and if the automaton recognizes all possible words, return an appropriate result.

> Example: The automaton ({0, 1, 2{, 0. {(0,a,1),(1,b,1),(1.8.2),(2,a.2),(26.1)}, {0, 1, 2}) does not recognize the word "b", but if we add the transition (0,b,1) it already recognizes all words.