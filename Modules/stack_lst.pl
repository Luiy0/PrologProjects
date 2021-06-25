/*
 * stack_lst.pl
 * By Antonio F. Huertas
 * This module implements a generic stack using a list.
 */

:- module(stack,
          [empty_stack/1, push/3, pop/3, iterate_stack/2]).

%% empty_stack(?Stack)
%  Creates an empty stack or checks if it is empty.
empty_stack(stack_list([])).

%% push(+Stack, +Top, ?NewStack)
%  Adds an element at the top of a stack.
push(stack_list(Rest), Top, stack_list([Top|Rest])).

%% pop(+Stack, ?Top, ?NewStack)
%  Removes the top element from a stack.  Thows an exception if the
%  stack is already empty.
pop(stack_list([Top|Rest]), Top, stack_list(Rest)).
pop(stack_list([]), _, _) :- throw(empty_exception('stack is empty')).

%% iterate_stack(+Stack, +Visit)
%  Iterates through a stack using a visit procedure.
iterate_stack(stack_list([Top|Rest]), Visit) :-
    Goal =.. [Visit, Top],
    call(Goal),
    iterate_stack(stack_list(Rest), Visit).

iterate_stack(stack_list([]), _).

