/*
 * stack_alg.pl
 * By Antonio F. Huertas
 * This module implements a generic stack using an algebraic definition:
 * A stack is either:
 *   1. empty
 *   2. a node that contains the top and the rest
 */

:- module(stack,
          [empty_stack/1, push/3, pop/3, iterate_stack/2]).

%% empty_stack(?Stack)
%  Creates an empty stack or checks if it is empty.
empty_stack(empty).

%% push(+Stack, +Top, ?NewStack)
%  Adds an element at the top of a stack.
push(Rest, Top, node(Top, Rest)).

%% pop(+Stack, ?Top, ?NewStack)
%  Removes the top element from a stack.  Thows an exception if the
%  stack is already empty.
pop(node(Top, Rest), Top, Rest).
pop(empty, _, _) :- throw(empty_exception('stack is empty')).

%% iterate_stack(+Stack, +Visit)
%  Iterates through a stack using a visit procedure.
iterate_stack(node(Top, Rest), Visit) :-
    Goal =.. [Visit, Top],
    call(Goal),
    iterate_stack(Rest, Visit).

iterate_stack(empty, _).

