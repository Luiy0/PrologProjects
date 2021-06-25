/*
 * circle_calc.pl
 * By Antonio F. Huertas
 * This program displays the area and circumference of a circle.
 */

%% pi(?PiValue)
%  Defines the value of pi.
pi(3.14159).

%% area_circle(+Radius, ?Area)
%  Computes the area of the circle with the given radius.
area_circle(Radius, Area) :-
    pi(PiValue),
    Area is PiValue * Radius ** 2.0.

%% circumference_circle(+Radius, ?Circum)
%  Computes the circumference of the circle with the given radius.
circumference_circle(Radius, Circum) :-
    pi(PiValue),
    Circum is 2 * PiValue * Radius.

%% start(+Radius)
%  Serves as an entry point for the program.
start(Radius) :-
    Radius < 0,
    write('Error! Negative radius'), nl.

start(Radius) :-
    Radius >= 0,
    write('The radius is '), write(Radius), nl,

    area_circle(Radius, Area),
    write('The area is '), write(Area), nl,
     
    circumference_circle(Radius, Circum),
    write('The circumference is '), write(Circum), nl.

