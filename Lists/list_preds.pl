/*
 * my_list_preds.pl
 * By Antonio F. Huertas
 * This program demonstrates how to define some list predicates.
 */

%% list_length(+List, ?Length)
%  Computes the number of elements in the given list.
list_length([_|Tail], Length) :-
    list_length(Tail, LengthTail),
    Length is 1 + LengthTail.
list_length([], 0).

%% list_length_v2(+List, ?Length)
%  Computes the number of elements in the given list.
%  NOTE: Uses a helper tail-recursive predicate.
list_length_v2(List, Length) :-
    length_v2_helper(List, 0, Length).

% length_v2_helper(+List, +Accum, ?Length)
length_v2_helper([_|Tail], Accum, Length) :-
    NewAccum is Accum + 1,
    length_v2_helper(Tail, NewAccum, Length).
    
length_v2_helper([], Accum, Accum).

%% list_sum(+NumberList, ?Sum)
%  Computes the sum of the elements in the given list of numbers.
list_sum([Head|Tail], Sum) :-
    list_sum(Tail, SumTail),
    Sum is Head + SumTail.
list_sum([], 0).

%% list_sum_v2(+NumberList, ?Sum)
%  Computes the sum of the elements in the given list.
%  NOTE: Uses a helper tail-recursive predicate.
list_sum_v2(List, Sum) :-
    sum_v2_helper(List, 0, Sum).

% sum_v2_helper(+NumberList, +Accum, ?Sum)
sum_v2_helper([Head|Tail], Accum, Sum) :-
    NewAccum is Accum + Head,
    sum_v2_helper(Tail, NewAccum, Sum).
    
sum_v2_helper([], Accum, Accum).

%% list_append(?List1, ?List2, ?Appended)
%  Concatenates two lists.
list_append([Head1|Tail1], List2, [Head1|NewList]) :-
    list_append(Tail1, List2, NewList).

list_append([], List2, List2).

%% list_append_v2(?List1, ?List2, ?Appended)
%  Concatenates two lists.
%  NOTE: Uses a helper tail-recursive predicate.
list_append_v2(List1, List2, Appended) :-
    reverse(List1, RevList1),
    append_v2_helper(List2, RevList1, Appended).

% append_v2_helper(?List, +Accum, ?Appended)
append_v2_helper([Head|Tail], Accum, Appended) :-
    append_v2_helper(Tail, [Head|Accum], Appended).
    
append_v2_helper([], Accum, Accum).

%% list_reverse(+List, ?Reversed)
%  Reverses the elements of the given list.
list_reverse([Head|Tail], Reversed) :-
    list_reverse(Tail, RevTail),
    append(RevTail, [Head], Reversed).

list_reverse([], []).

%% list_reverse_v2(+List, ?Reversed)
%  Reverses the elements of the given list.
%  NOTE: Uses a helper tail-recursive predicate.
list_reverse_v2(List, Reversed) :-
    reverse_v2_helper(List, [], Reversed).

% reverse_v2_helper(+List, +Accum, ?Reversed)
reverse_v2_helper([Head|Tail], Accum, Reversed) :-
     reverse_v2_helper(Tail, [Head|Accum], Reversed).
     
reverse_v2_helper([], Accum, Accum).

%% list_member(?Elem, +List)
%  Determines whether an element is a member of the given list.
list_member(Elem, [_|Tail]) :-
    list_member(Elem, Tail).

list_member(Elem, [Elem|_]).

%% list_nth0(+Index, +List, ?NthElem)
%  Computes the element at the nth index of the given list assuming the
%  first index is 0.

list_nth0(Index, [_|Tail], NthElem) :-
    Index > 0,
    NewIndex is Index - 1,
    list_nth0(NewIndex, Tail, NthElem).

list_nth0(0, [Head|_], Head).

%% list_sort(+List, ?Sorted)
%  Sorts a list in ascending order using quicksort.
list_sort([Head|Tail], Sorted) :-
    partition(Head, Tail, Smaller, Greater),
    list_sort(Smaller, SortedSmaller),
    list_sort(Greater, SortedGreater),
    append(SortedSmaller, [Head|SortedGreater], Sorted).

list_sort([], []).

% partition(+Pivot, +List, ?Smaller, ?Greater)
% Partitions a list into elements smaller than the pivot and
% elements greater than the pivot.
partition(Pivot, [Head|Tail], [Head|Smaller], Greater) :-
    Head < Pivot,
    partition(Pivot, Tail, Smaller, Greater).

partition(Pivot, [Head|Tail], Smaller, [Head|Greater]) :-
    Head >= Pivot,
    partition(Pivot, Tail, Smaller, Greater).

partition(_, [], [], []).

%% start
%  Serves as an entry point for the program.
start :-
    List =  [30,40,10,50,20],
    write('This is the list: '), write(List), nl,

    List = [Head|Tail],
    write('The head is '), write(Head), nl,
    write('The tail is '), write(Tail), nl,

    list_length(List, Length),
    write('The length is '), write(Length), nl,

    list_length_v2(List, Length2),
    write('\tTail Recursion: The length is '), write(Length2), nl,

    list_sum(List, Sum),
    write('The sum of the elements is '), write(Sum), nl,

    list_sum_v2(List, Sum2),
    write('\tTail Recursion: The sum of the elements is '), write(Sum2), nl,

    list_reverse(List, Reversed),
    write('The reversed elements are '), write(Reversed), nl,

    list_reverse_v2(List, Reversed2),
    write('\tTail Recursion: The reversed elements are '), write(Reversed2), nl,

    list_sort(List, Sorted),
    write('The sorted elements are '), write(Sorted), nl,

    list_nth0(2, List, NthElem),
    write('The element at index #2 is '), write(NthElem), nl,

    write('Does the list contain 20? '),
    (
        list_member(20, List),
        write('Yes.\n')
        ;
        write('No.\n')
    ),

    List2 = [50,60,70,80,90,100],
    write('\nThis is the second list: '), write(List2), nl,

    list_append(List, List2, Appended),
    write('Concatenating original and second lists: '),
    write(Appended), nl.
