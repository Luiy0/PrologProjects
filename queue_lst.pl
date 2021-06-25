/*
 * queue_lst.pl
 * This module implements a generic queue using a list.
 */

:- module(queue,
          [empty_queue/1, enqueue/3, dequeue/3, iterate_queue/2]).

%% empty_queue(?Queue)
%  Creates an empty queue or checks if it is empty.
empty_queue(queue_list([], [])).

%% enqueue(+Queue, +Top, ?NewQueue)
%  Adds an element at the rear end of a queue.
enqueue(queue_list(Lst,Rest), Top, queue_list(Lst,[Top|Rest])).

%% dequeue(+Queue, ?Top, ?NewQueue)
%  Removes the front element from a queue.  Thows an exception if the
%  queue is already empty.
dequeue(queue_list([],[]), _, _):-throw(empty_exception('queue is empty')).
dequeue(queue_list([Head|Rest], Lst2), Head, queue_list(Rest, Lst2)).
dequeue(queue_list([], Lst), Top, NewList):-
	reverse(Lst, NewLst),
	dequeue(queue_list(NewLst, []), Top, NewList).

%% iterate_queue(+Queue, +Visit)
%  Iterates through a queue using a visit procedure.
iterate_queue(queue_list([], []), _).
iterate_queue(queue_list([], Lst), Visit):-
	reverse(Lst, NewLst),
	iterate_queue(queue_list(NewLst, []), Visit).
iterate_queue(queue_list([Head|Rest], Lst), Visit):-
	Goal =.. [Visit, Head],
	call(Goal),
	iterate_queue(queue_list(Rest, Lst), Visit).
