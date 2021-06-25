/*
 * genealogy.pl
 * By Antonio F. Huertas
 * This program is a knowledge base about genealogy in Greek mythology.

                            Uranus - Gaia
                               |       |
                               ---------
                                   |
                               ---------
                               |       |
                            Cronus - Rhea
                               |       |
                               ---------
                                   |
                    ------------------------------------
                    |       |         |        |       |
         Danae -  Zeus  - Hera    Poseidon   Hades   Zeus - Leda
           |      |  |     |                          |       |
           --------  --------                         ---------
               |         |                                 |
Andromeda - Perseus    Ares                          Helen of Troy
    |          |
    ------------
          |
    ------------
    |          |
 Heleus     Perses

 */

%% parent(?Person, ?Parent)
%  Defines people and their respective parents.
parent('Cronus', 'Uranus').
parent('Cronus', 'Gaia').
parent('Rhea', 'Uranus').
parent('Rhea', 'Gaia').
parent('Zeus', 'Cronus').
parent('Zeus', 'Rhea').
parent('Hera', 'Cronus').
parent('Hera', 'Rhea').
parent('Poseidon', 'Cronus').
parent('Poseidon', 'Rhea').
parent('Hades', 'Cronus').
parent('Hades', 'Rhea').
parent('Ares', 'Zeus').
parent('Ares', 'Hera').
parent('Perseus', 'Zeus').
parent('Perseus', 'Danae').
parent('Helen of Troy', 'Zeus').
parent('Helen of Troy', 'Leda').
parent('Heleus', 'Perseus').
parent('Heleus', 'Andromeda').
parent('Perses', 'Perseus').
parent('Perses', 'Andromeda').

%% sibling(?Person1, ?Person2)
%  Determines whether two people are siblings
sibling(Person1, Person2) :- Person1 \= Person2, parent(Person1, Parent),
                             parent(Person2, Parent).

%% grandparent(?Person, ?Grandparent)
%  Determines whether someone is the grandparent of a person.
grandparent(Person, Grandparent) :- parent(Person, Parent), parent(Parent, Grandparent).

%% ancestor(?Person, ?Ancestor)
%  Determines whether someone is the ancestor of a person.
ancestor(Person, Ancestor) :- parent(Person, Ancestor).
ancestor(Person, Ancestor) :- parent(Person, Parent), ancestor(Parent, Ancestor).

