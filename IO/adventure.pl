/*
 * adventure.pl
 * By Adam Brooks Webber
 * This is a little adventure game. There are three entities: you,
 * a treasure, and an ogre. There are six places: a valley, a path,
 * a cliff, a fork, a maze, and a mountaintop. Your goal is to get
 * the treasure without being killed first.
 *
 * NOTE: This program appears in Webber's textbook "Modern Programming
 *       Languages: A Practical Introduction".
 *
 * Modified by Antonio F. Huertas
 * I removed the cuts, rewrote some comments and predicate names,
 * added the quit predicate, and signaled the dynamic and the
 * initialization predicates.
 */

:-dynamic(at/2).
:-initialization(go).

 /*
  * These are text descriptions of all the places in the game.
  */
description(valley, 'You are in a pleasant valley, with a trail ahead.').
description(path, 'You are on a path, with ravines on both sides.').
description(cliff, 'You are teetering on the edge of a cliff.').
description(fork, 'You are at a fork in the path.').
description(maze(_), 'You are in a maze of twisty trails, all alike.').
description(mountaintop, 'You are on the mountaintop.').

/*
 * The report predicate prints the description of your current location.
 */
report :-
    at(you,Loc),
    description(Loc,Desc),
    write(Desc), nl.

/*
 * The connected predicate establishes the map.
 * The meaning of connected(X,Dir,Y) is that if you are at X and you
 * move in direction Dir, you get to Y. Recognized directions are
 * forward, right and left.
 */
connected(valley,forward,path).
connected(path,right,cliff).
connected(path,left,cliff).
connected(path,forward,fork).
connected(fork,left,maze(0)).
connected(fork,right,mountaintop).
connected(maze(0),left,maze(1)).
connected(maze(0),right,maze(3)).
connected(maze(1),left,maze(0)).
connected(maze(1),right,maze(2)).
connected(maze(2),left,fork).
connected(maze(2),right,maze(0)).
connected(maze(3),left,maze(0)).
connected(maze(3),right,maze(3)).

/*
 * The move(Dir) predicte moves you in direction Dir, then prints the
 * description of your new location.  But if the argument was not a
 * legal direction, print an error message and don't move.
 */
move(Dir) :-
    at(you,Loc),
    connected(Loc,Dir,Next),
    retract(at(you,Loc)),
    assert(at(you,Next)),
    report.

move(Dir) :-
    at(you,Loc),
    \+ connected(Loc,Dir,_),
    write('That is not a legal move.\n'),
    report.

/*
 * These are shorthands for the moves.
 */
forward :- move(forward).
left :- move(left).
right :- move(right).

/*
 * If you quit, the game will be done.
 */
quit :-
    write('Quitters do not have adventures...\n'),
    retract(at(you,_)),
    assert(at(you,done)).

/*
 * If you and the ogre are at the same place, it kills you.  But if you
 * and the ogre are not in the same place, nothing happens.*/
ogre :-
    at(you,Loc),
    at(ogre,Loc),
    write('You found an ogre.  It sucks your brain out through '),
    write('your eyesockets, and you die.\n'),
    retract(at(you,Loc)),
    assert(at(you,done)).

ogre :-
    at(you,Loc),
    \+ at(ogre,Loc).

/*
 * If you and the treasure are at the same place, you win.  But if you
 * and the treasure are not in the same place, nothing happens.
 */
treasure :-
    at(you,Loc),
    at(treasure,Loc),
    write('There is a treasure here.\n'),
    write('Congratulations, you win!\n'),
    retract(at(you,Loc)),
    assert(at(you,done)).
    
treasure :-
    at(you,Loc),
    \+ at(treasure,Loc).

/*
 * If you are at the cliff, you fall off and die.  But if you
 * are not at the cliff nothing happens.
 */
cliff :-
   at(you,cliff),
   write('You fall off and die.\n'),
   retract(at(you,cliff)),
   assert(at(you,done)).

cliff :-
   \+ at(you,cliff).

/*
 * This is the main loop.
 * Get a move from the user and make it. Then check the game status.
 * Then repeat until the player is done because he/she won or lost.
 */
main :-
    \+ at(you,done),
    nl, write('Next move?: '),
    read(Move),
    call(Move),
    ogre,
    treasure,
    cliff,
    main.

main :-
    at(you,done),
    write('Thanks for playing.'), nl,
    retractall(at(_,_)).

/*
 * This is the starting point for the game. We assert the initial
 * conditions, print an initial report, then start the main loop.
 */
go :-
    assert(at(you,valley)),
    assert(at(ogre,maze(3))),
    assert(at(treasure,mountaintop)),
    write('This is an adventure game.\n'),
    write('Legal moves are left, right or forward.\n'),
    write('End each move with a period.\n\n'),
    report,
    main.
