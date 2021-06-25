%% dotProduct(?List, ?List2, Result)
% Determines the dot product of two lists representing vectors of the
% same length using regular Recursion.
dotProduct([],[],0).
dotProduct([Head|Rest], [Head2|Rest2], Result) :-
        ResultP is Head * Head2,
        dotProduct(Rest, Rest2, Left),
        Result is ResultP + Left.

%% dotProductTail(?List, ?List2, Result)
% Determines the dot product of two lists representing vectors of the
% same length using tail Recursion.
dotProductTail(List,List2, Result) :-
        dotHelper(List,List2, 0, Result).
dotHelper([Head|Rest],[Head2|Rest2], Acc, Result) :-
        NewAcc is Head * Head2,
        ResultF is Acc + NewAcc,
        dotHelper(Rest, Rest2, ResultF, Result).
dotHelper(_, _, Acc,Acc).