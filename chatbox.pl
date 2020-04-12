dr_simi:-
    write('?'),read_word_list(Input),dr_simi(Input),!.
dr_simi([bye]):-
    write('Goodbye.I hope i have helped you'),nl.
dr_simi(Input):- pattern(Stimulus,Response),
    match(Stimulus, Dictionary, Input),
    match(Response, Dictionary, Output),
    reply(Output),
    !,dr_simi.

match[N|Pattern], Dictionary, Target) :-
    integer(N), lookup(N, Dictionary, LeftTarget),
    append(LeftTarget, RightTarget, Target),
    match(Pattern, Dictionary, RightTarget).
match
match([Word | Pattern], Dictionary, [Word | Target]) :-
    atom(Word), match(Pattern, Dictionary, Target).
match([], _Dictionary, []).

pattern([buen,dia,me,llamo,1],[como,te,sientes,hoy,1,'?']).
pattern([me,siento,2],[desde,cuando,te,siente,2,'?']).
pattern([uno,de,mis,sintomas,es,3],[1,cuando,te,dan,3,'?']).
pattern([1,X,3],[dime,mas,sobre,X]):-important(X).
pattern([que,puedo,tomar],[1,toma,paracetamol]).

important(doctor).
important(doctora).
important(farmaceutico).
important(cliente).

reply([Head | Tail]):-
    write(Head),write(''),replay(Tail).
replay([]):-nl.

lookup(Key,[(Key,Value)| _Dict]Value).
lookup(Key,[Key1,_Val1)|Dictionary],Value):-
     Key \= Key1, lookup(Key, Dictionary, Value).

read_word_list(Ws) :-
    read_line_to_codes(user_input, Cs),
    atom_codes(A, Cs),
    tokenize_atom(A, Ws).



