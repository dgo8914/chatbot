
dr_simi :-
    write('? '), read_word_list(Input), dr_simi(Input), !.

dr_simi([bye]) :-
    write('Goodbye. I hope I have helped you'), nl.
dr_simi(Input) :-
    pattern(Stimulus, Response),
    match(Stimulus, Dictionary, Input),
    match(Response, Dictionary, Output),
    reply(Output),
    !, dr_simi.

match([N|Pattern], Dictionary, Target) :-
    integer(N), lookup(N, Dictionary, LeftTarget),
    append(LeftTarget, RightTarget, Target),
    match(Pattern, Dictionary, RightTarget).
match([Word | Pattern], Dictionary, [Word | Target]) :-
    atom(Word), match(Pattern, Dictionary, Target).
match([], _Dictionary, []).


pattern([buen,dia,me,llamo,1],[como,lo,puedo,atender,hoy,1,'?']).
pattern([que,me,tomo,para,2],[que,sintomas,tiene,de,2,'?']).
pattern([me,siento,3],[desde,cuando,te,siente,'?']).
pattern([hace,4],[que,sintomas,tiene,aparte,de,4,'?']).
pattern([otro,de,mis,sintomas,es,5],[1,cuando,te,dan,5,'?']).
pattern([1,X,3],[dime,mas,sobre,X]):-important(X).
pattern([que,puedo,tomar],[1,toma,paracetamol]).



important(doctor).
important(doctora).
important(farmaceutico).
important(cliente).


reply([Head | Tail]) :-
    write(Head), write(' '), reply(Tail).
reply([]) :- nl.

lookup(Key, [(Key, Value) | _Dict], Value).
lookup(Key, [(Key1, _Val1) | Dictionary], Value) :-
    Key \= Key1, lookup(Key, Dictionary, Value).

read_word_list(Ws) :-
    read_line_to_codes(user_input, Cs),
    atom_codes(A, Cs),
    tokenize_atom(A, Ws).












