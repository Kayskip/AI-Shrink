% 1.1 Representing sentences

transformWord(qm, '?').
transformWord(i, you).
transformWord(im, youre).
transformWord(me, you).
transformWord(you, me).
transformWord(was, were).
transformWord(am, are).
transformWord(my, your).
transformWord(your, my).
transformWord(myself, yourself).

reply([]).
reply([H | T]):- ((H == '?') ->  write(' '), write('qm');(H == 'i') ->  write('have you'); write(' '), write(H)), reply(T).


/*append */
% 1.2 Printing sentences
printSentence([]).
printSentence([H | T]) :- ((H == qm) -> write('?'); (write(' '), write(H))), printSentence(T).

/* e.g., “my → your”, “you → me”,“am → are”.*/
