/*
 * arith_preds.pl
 * By Luis A. Flores (841102500)
 * 12/16/2015
 * Contains predicates used for arithmetic and list processing.
 */

%% fibo(+Number, Result)
% Returns the nth number of the fibonnaci sequence using recursion.
fibo(0,0).
fibo(1,1).
fibo(Number, Result) :-
        Number > 0,
        NumFirst is Number - 1, fibo(NumFirst, Num1),
        NumSecond is Number - 2, fibo(NumSecond, Num2),
        Result is Num1 + Num2.

%% fiboTail(+Number, Result)
% Returns the nth number of the fibonnaci sequence using tail recursion.
fiboTail(Number, Result) :-
        fiboTailHelper(Number, 0,1, Result).

fiboTailHelper(Number, Num1, Num2, Acc) :-
        Number > 0,
        NumFirst is Number -1,
        NewAccum is Num1 + Num2,
        fiboTailHelper(NumFirst, Num2, NewAccum, Acc).
fiboTailHelper(0,Acc, _, Acc).

%% listMin(?List, Result)
% Receives a List and determines the minimum number.
listMin([Lst], Lst).
listMin([Hd, Hd2|Rest], Result) :-
        Hd > Hd2 ->
        listMin([Hd2|Rest], Result)
        ;
        listMin([Hd|Rest], Result).

%% listMinTail(?List, Result)
% Receives a List and determines the minimum number.
listMinTail([Head|Rest], Result) :-
        minHelper(Rest, Head, Result).

minHelper([Head|Rest], Acc, Result) :-
        NewAcc is min(Head,Acc),
        minHelper(Rest, NewAcc, Result).
minHelper([], Acc, Acc).

%% scalarMult(?Num,?List, Result)
% Receives a List and returns the result of multiplying an integer by
% each member of a list of integers using regular recursion.
scalarMult(_, [], []).
scalarMult(Num, [Head|Rest], [Head2|Rest2]) :-
        Head2 is Num * Head,
        scalarMult(Num,Rest, Rest2).

%% scalarMultTail(?Num,?List, Result)
% Receives a List and returns the result of multiplying an integer by
% each member of a list of integers using Tail Recursion.
scalarMultTail(Num, Lst, ResultList) :-
        scalarHelper(Num, Lst, [], List),
        reverse(ResultList, List).

scalarHelper(Num,[Head|Rest],Acc,Result) :-
        NewAcc is Head * Num,
        scalarHelper(Num, Rest, [NewAcc|Acc], Result).
scalarHelper(_, [],Acc,Acc).

%% list_insert(+Elem, ?List, Inserted)
% Inserts the given element in the given sorted list of numbers.
% The operator '!' is used to stop automatic backtracking (chapter 10).
list_insert(Elem, [], [Elem]) :- !.
list_insert(Elem, [Head|Rest], [Elem,Head|Rest]) :- Elem =< Head, !.
list_insert(Elem, [Head|Rest], [Head|Rest2]) :- list_insert(Elem, Rest, Rest2).

%% insertion_sort(+List, Sorted)
% Sorts the given list by using the insertion algorithm.
insertion_sort([], []).
insertion_sort([Head|Rest], Result) :-
        insertion_sort(Rest, Result2),
        list_insert(Head, Result2, Result).




