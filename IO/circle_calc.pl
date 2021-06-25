/*
 * circle_calc_io.pl
 * By Antonio F. Huertas
 * This program displays the area and circumference of a circle.
 */

:-initialization(main).

%% area_circle(+Radius, ?Area)
%  Computes the area of the circle with the given radius.
area_circle(Radius, Area) :-
    Area is pi * Radius ** 2.0.     % pi is a predifined constant.

%% circumference_circle(+Radius, ?Circum)
%  Computes the circumference of the circle with the given radius.
circumference_circle(Radius, Circum) :-
    Circum is 2 * pi * Radius.      % pi is a predifined constant.

%% write_results(+Radius)
%  Displays the results of processing the circle with the given radius.
write_results(Radius) :-
    Radius < 0,
    write('Error! Negative radius.\n').
    
write_results(Radius) :-
    Radius >= 0,
    area_circle(Radius, Area),
    circumference_circle(Radius, Circum),
    format('The area is ~3f and the circumference is ~3f~n', [Area, Circum]).

%% main
%  Serves as an entry point for the program.
main :-
    write('End ALL input with a full stop.'), nl,
    write('Enter radius of the circle: '),
    read(Radius),
    write_results(Radius).

