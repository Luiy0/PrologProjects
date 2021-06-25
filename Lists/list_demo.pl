/*
 * list_demo.pl
 * By Antonio F. Huertas
 * This program demonstrates some list operators and some predicates
 * from the automatically-imported 'lists' library.
 */

%% start
%  Serves as an entry point for the program.
start :-
    List =  [30,40,10,50,20],
    write('This is the list: '), write(List), nl,
    
    List = [Head|Tail],
    write('The head is '), write(Head), nl,
    write('The tail is '), write(Tail), nl,
    
    length(List, Length),
    write('The length is '), write(Length), nl,
    
    sumlist(List, Sum),
    write('The sum of the elements is '), write(Sum), nl,
    
    reverse(List, Reversed),
    write('The reversed elements are '), write(Reversed), nl,

    sort(List, Sorted),
    write('The sorted elements are '), write(Sorted), nl,

    nth0(2, List, NthElem),
    write('The element at index #2 is '), write(NthElem), nl,

    write('Does the list contain 20? '),
    (
        member(20, List),
        write('Yes.\n')
        ;
        write('No.\n')
    ),

    List2 = [50,60,70,80,90,100],
    write('\nThis is the second list: '), write(List2), nl,
    
    append(List, List2, Appended),
    write('Concatenating original and second lists: '),
    write(Appended), nl.
