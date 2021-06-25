/*
 * linked_list.pl
 * By Antonio F. Huertas
 * This program defines and manipulates a linked list of integers.
 */

%% sum_list(+IntList, ?Sum)
%  Computes the sum of the elements in the given list.
sum_list(cons(Head, Tail), Sum) :-
    sum_list(Tail, SumTail),
    Sum is Head + SumTail.

sum_list(nil, 0).

%% member_list(?Elem, +List)
%  Determines whether an element is a member of the given list.
member_list(Elem, cons(_, Tail)) :-
    member_list(Elem, Tail).

member_list(Elem, cons(Elem, _)).

%% write_list(+List)
%  Displays the elements of the given list.
write_list(cons(Head, Tail)) :-
    write(Head), write(" "),
    write_list(Tail).

write_list(nil).

%% start
%  Serves as an entry point for the program.
start :-
    List = cons(30, cons(40, cons(10, cons(50, cons(20, nil))))),
    write('This is the list: '), write_list(List), nl,
    write('This is the list, internally: '), write(List), nl,

    List = cons(Head,Tail),
    write('The head is '), write(Head), nl,
    write('The tail is '), write(Tail), nl,

    sum_list(List, Sum),
    write('The sum of the elements is '), write(Sum), nl,

    write('Does the list contain 20? '),
    (
        member_list(20, List),
        write('Yes.\n')
        ;
        write('No.\n')
    ), nl.

