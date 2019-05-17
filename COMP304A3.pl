/*
    printSentence takes a list and writes it to the terminal
    here we are checking for a question mark (qm)
    otherwise we are outputing the desired element with a space
    then recursing on it to repeat until the list is empty
*/

% 1.2 Printing sentences
printSentence([]).
printSentence([H | T]):-((H == qm) -> write('?');
                        (write(H), write(' '))), 
                        printSentence(T).

% 1.3 Answering input
answer(Input, Output):- append(_, X, Input), match(X, Answer).

/*
    match takes two lists, an input and an output.
    here we are checking the elements to see if the consist of certain input
    if so, we will append the answer to the rest of the list, storing it in a temporary list
    we then call print sentence to write and output it for us
*/

match([],[]).
match([H1,H2|XS], Result):- (H1 == i),(H2 == feel) -> append([why,do,you,feel], XS, Temp), printSentence(Temp).
match([H1,H2|XS], Result):- (H1 == i),(H2 == fantasised) -> append([have,you,ever], XS, Temp), printSentence(Temp).
match([H1,H2|XS], Result):- (H1 == you) -> append([lets,not,talk,about,me], XS, Temp), printSentence(Temp).


/*
    Hint: Predicate answer/2 should make use of other predicates like match/2
    (for finding keywords in input lists) and transform/2 (for transforming input
    phrases into the corresponding output fragments (see section 1)).
*/

/*
    if you find a keyword in the input list,
     transform the input to an output
*/


printReply(List) :- forall(answer(List, Result), printSentence(Result)).
printTest(List) :- write(List), write('\n\n Result: \n'), printReply(List), write('\n').
/*
    test() will call printTest using sentences I have constructed myself and parse it
    this will then write the current list out to the terminal
    it will then call printReply which grabs all the words in the list and calls
    answer to get the results and uses printSentence to show the results
*/


test1() :- printTest([i, feel, like, i, have, no, time, for, my, other, assignments]).
test2() :- printTest([i, feel, simply, amazing]).
test3() :- printTest([i, fantasised, that, me, and, you, were, friends]).
test4() :- printTest([i, fantasised, about, eating, snacks]).
test5() :- printTest([i, fantasised, about, myself, eating, your, snacks]).
test6() :- printTest([i, want, to, make, you, happy]).
test7() :- printTest([i, want, a, beer]).
test8() :- printTest([should, i, drop, out]).
test9() :- printTest([should, i, stop, talking, to, you, about, my, nightmare]).
test10() :- printTest([why, are, you, talking, to, me, qm]).
test11() :- printTest([why, qm]).
test12() :- printTest([why, the, fuck]).
test13() :- printTest([what, shit, is, this]).
test14() :- printTest([please, can, i, leave, now]).

