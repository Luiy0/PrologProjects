/*
 * structure_demo.pl
 * By Antonio F. Huertas
 * This program demonstrates how to create and use structures.
 */

%% write_list(+List)
%  Displays the elements of the given list.
write_list([Head|Tail]) :-
    write('Data:'),
    write_data(Head), nl,
    write_list(Tail).

write_list([]).

%% write_data(+Item)
%  Displays the data of the given item.
write_data(item(Id, Desc, Price, OnHand)) :-
    write('\tId = '), write(Id), nl,
    write('\tDescription = '), write(Desc), nl,
    write('\tPrice = $'), write(Price), nl,
    write('\tQuantity on Hand = '), write(OnHand), nl, nl.
    
%% start
%  Serves as an entry point for the program.
start :-
    Item1 = item('1234', 'Hammer', 8.99, 5),
    write('This is Item1: '), write(Item1), nl,
    
    Clone = Item1,
    write('This is a clone of Item1: '), write(Clone), nl,
    
    List = [
         item('1234', 'Hammer', 8.99, 5),
         item('5678', 'Saw', 12.99, 10),
         item('9012', 'Screwdriver', 4.99, 20)
    ],
    
    nl, write('This is a list of items...\n'),
    write_list(List),
    
    [Head|_] = List,
    (
        Item1 = Head,
        nl, write('Items item1 and the first element are the same\n')
        ;
        nl, write('Items item1 and the first element are NOT the same\n')
    ).

