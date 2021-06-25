/*
 * shapes_calc.pl
 * By Antonio F. Huertas
 * This program displays the data, including the area and perimeter,
 * of a list of shapes.
 */

%% pi(?PiValue)
%  Defines the value of pi.
pi(3.14159).

%% area(+Shape, ?Area)
%  Computes the area of the given shape.
area(circle(_, _, Radius), Area) :-
    pi(PiValue),
    Area is PiValue * Radius ** 2.0.

area(rectangle(_, _, Height, Width), Area) :-
    Area is Height * Width.

%% perimeter(+Shape, ?Perimeter)
%  Computes the perimeter of the given shape.
perimeter(circle(_, _, Radius), Perimeter) :-
    pi(PiValue),
    Perimeter is 2 * PiValue * Radius.

perimeter(rectangle(_, _, Height, Width), Perimeter) :-
    Perimeter is 2 * (Height + Width).

%% write_data(+Shape)
%  Displays the data of the given shape, including area and perimeter.
write_data(Shape) :-
    write_header(Shape),
    
    area(Shape, Area),
    write('\tArea = '), write(Area),

    perimeter(Shape, Perimeter),
    write(', Perimeter = '), write(Perimeter), nl.
    
%% write_header(+Shape)
%  Displays the general data of the given shape.
write_header(circle(Color, point(X, Y), Radius)) :-
    write('\tKind = Circle'), nl,
    write('\tColor = '), write(Color),
    write(', Location = '), write(X), write(','), write(Y), nl,
    write('\tRadius = '), write(Radius), nl.
    
write_header(rectangle(Color, point(X, Y), Height, Width)) :-
    write('\tKind = Rectangle'), nl,
    write('\tColor = '), write(Color),
    write(', Location = '), write(X), write(','), write(Y), nl,
    write('\tHeight = '), write(Height),
    write(', Width = '), write(Width), nl.

%% write_list(+List)
%  Displays the elements of the given list.
write_list([Head|Tail]) :-
    write('Data:'),
    write_data(Head), nl,
    write_list(Tail).

write_list([]).

%% start
%  Serves as an entry point for the program.
start :-
    List = [
        circle(red, point(1.0, 2.0), 5.0),
        rectangle(green, point(10.0, 15.0), 4.0, 2.0),
        circle(blue, point(9.0, 3.0), 6.0)
    ],
    write('These are the shapes:\n'),
    write_list(List), nl.
