/*
 * mythology.pl
 * By Antonio F. Huertas
 * This program is a knowledge base about beings in Greek mythology.
 */

%% god(?Person)
%  Defines who is a god.
god('Zeus').
god('Ares').
god('Aphrodite').
god('Perseus').
god('Helen of Troy').

%% human(?Person)
%  Defines who is a human.
human('Socrates').
human('Aristotle').
human('Perseus').
human('Helen of Troy').

%% mortal(?Person)
%  Determines whether someone is mortal.
mortal(Person) :- human(Person).

%% immortal(?Person)
%  Determines whether someone is immortal.
immortal(Person) :- god(Person), \+ human(Person).

%% demigod(?Person)
% Determines whether someone is a demigod.
demigod(Person) :- god(Person), human(Person).

%% being(?Person)
%  Determines whether someone is a being.
being(Person) :- god(Person) ; human(Person).

