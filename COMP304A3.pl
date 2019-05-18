/*
    Name: Karu Skipper
    ID : 300417869
    COMP304 Assignment 3 : (Basic Prolog)
    Due Date: 20 May, 2019

    printSentence takes a list and writes it to the terminal.
    otherwise we are outputing the desired element with a space
    then recursing on it to repeat until the list is empty.
    this will be used to output the results
    
    e.g.
    X = [i, know, i, cannot, sing] ;
    X = [know, i ,cannot, sing] ;
    X = [i, cannot, sing] ;
    X = [cannot, sing] ;
    X = [sing] ;
    X = [] ;

    this was my original printSentence structure, which identified the 
    question mark within the function, i later changed this when i started
    on later sections of the assignment. 

    printSentence([]).
    printSentence([H | T]) :- (H == qm) -> write('?'), printSentence(T).
*/

% 1.2 Printing sentences
printSentence([]).
printSentence([X | XS]) :- write(X), write(' '), printSentence(XS).

/*
    answer takes two lists, an input and an output.
    here we will parse the X value into match after appending, 
    this will in turn return the Answer through this function.
*/

% 1.3 Answering input
answer([],[]).
answer(Input, Answer) :- append(_, X, Input), match(X, Answer).

/*
    match is the most important part of the Ai which is responsible for 
    idenfying input and returning output to answer. here we have used the 
    key words to identify the output. originally i had a layout which matched
    the first and second elements to keywords but eventually changed to a more efficient way.

    eg.
    match([H1, H2 | XS], Result) :- (H1 == i), (H2 == feel) -> append([what, makes, you, feel], XS, Temp). 
    printSentence(Temp). this consisted of appending the list to the rest of the input list,
    but i ran into errors with transforming keywords
    as i was only accessing the first 2 elements

    here we are accomplishing the same thing but transforming the list, beforing appending it. storing it in a temporary list
    and appending this temporary list with '?' if the reply is a question. this also accounted for other different
    responses.

    once i got the first match working, making more was quite easy
*/

match([],[]).
match([i, feel | XS], Result) :- transform(XS, Transformed), append([what, makes, you, feel], Transformed, Temp),
    append(Temp, ['?'], Result).

match([i, fantasised | XS], Result) :- transform(XS, Transformed), append([have, you, ever, fantasised], Transformed, Temp),
    append(Temp, [before, '?'], Result).

match([i, want | XS], Result) :- transform(XS, Transformed), append([if, you, want], Transformed, Temp),
    append(Temp, [you, must, work, for, it], Result).

match([should, i | XS], Result) :- transform(XS, Transformed), append([if, you, want, to], Transformed, Temp),
    append(Temp, [then, i, wont, stop, you], Result).

/*
    here are some other matches used for idenfying input,
    this is where i was able to replace the qm from the original 
    printSentence and add it as an indenfier here.

    this is similar to above as it looks for qm, disragarding the rest of the list,
    appending a simple response and adding it to the empty list, ending in a Result list to be used
    match([qm | _], Result) :- append([why, do, you, ask, '?'], [], Result).

*/

match([qm | _], Result) :- append([why, do, you, ask, '?'], [], Result).
match([you | _], Result) :- append([let, us, not, talk, about, me], [], Result).
match([nightmare | _], Result) :- append([do, nightmares, frighten, you, '?'], [], Result).

match([fuck | _], Result) :- append([watch, your, language], [], Result).
match([shit | _], Result) :- append([watch, your, language], [], Result).
match([please | _], Result) :- append([i, appreciate, your, manners], [], Result).

/*





*/

transform([], []).
transform([X | XS], [Y | YS]) :- once(transformWord(X, Y)), transform(XS, YS).
 
transformWord(am, are).
transformWord(my, your).
transformWord(me, you).
transformWord(you, me).
transformWord(qm, '?').
transformWord(i, you).
transformWord(im, youre).
transformWord(was, were).
transformWord(your, my).
transformWord(myself, yourself).

transformWord(List, List).

/*







*/

printReply(List) :- forall(answer(List, Result), printSentence(Result)).
printTest(List) :- write(List), write('\n -> '), printReply(List), write('\n').
 
test1() :- printTest([i, feel, so, tired]).
test2() :- printTest([i, feel, great, after, spending, so, long, on, this, assignment]).
test3() :- printTest([i, fantasised, that, i, had, a, girlfriend]).
test4() :- printTest([i, fantasised, about, eating, lots, of, food,and,being,rich]).
test5() :- printTest([i, fantasised, about, myself, eating, your, snacks]).
test6() :- printTest([i, want, my, company, to, earn, some, money]).
test7() :- printTest([i, want, to, drink, a,lot,of,beer,this,weekend]).
test8() :- printTest([should, i, ask, this, girl, out, for, a, drink]).
test9() :- printTest([should, i, stop, crying, about, my, nightmare]).
test10() :- printTest([why, is, this, assignment, so, annoying,?]).
test11() :- printTest([why, do, i, cry, myself, to, sleep, qm]).
test12() :- printTest([why, the, fuck]).
test13() :- printTest([what, shit, is, this]).
test14() :- printTest([please, can, i, leave, now]).
 
tests() :-  write('---------------\n'), 
            write('Input\n -> Reply \n'), 
            write('---------------\n\n'),
            test1(), 
            test2(), 
            test3(), 
            test4(), 
            test5(), 
            test6(), 
            test7(), 
            test8(), 
            test9(),
            test10(),
            test11(), 
            test12(), 
            test13(), 
            test14().