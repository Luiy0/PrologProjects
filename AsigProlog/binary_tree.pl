/*
 * binary_tree.pl
 * By Antonio F. Huertas and Luis A. Flores (841102500)
 * 12/16/2015
 * This program defines and manipulates a binary search tree of integers.
 */

%% sum_tree(+IntTree, ?Sum)
%  Computes the sum of the elements in the given tree.
sum_tree(node(Root, Left, Right), Sum) :-
    sum_tree(Left, SumLeft),
    sum_tree(Right, SumRight),
    Sum is Root + SumLeft + SumRight.
sum_tree(nil, 0).

%% member_tree(?Elem, +IntTree)
%  Determines whether an element is a member of the given tree.
member_tree(Elem, node(Root, Left, _)) :-
    Elem < Root,
    member_tree(Elem, Left).

member_tree(Elem, node(Root, _, Right)) :-
    Elem > Root,
    member_tree(Elem, Right).

member_tree(Elem, node(Elem, _, _)).

%% add_tree(+Elem, +IntTree, ?NewTree)
%  Determines which tree results by adding the given element to the
%  given tree.
add_tree(Elem, node(Root, Left, Right), node(Root, NewLeft, Right)) :-
    Elem < Root,
    add_tree(Elem, Left, NewLeft).

add_tree(Elem, node(Root, Left, Right), node(Root, Left, NewRight)) :-
    Elem > Root,
    add_tree(Elem, Right, NewRight).

add_tree(Elem, node(Elem, Left, Right), node(Elem, Left, Right)).

add_tree(Elem, nil, node(Elem, nil, nil)).

%% construct_tree(+List, Tree)
%  Constructs the corresponding binary search tree for the given list.
construct_tree(List, Tree) :-
    construct_helper(List, nil, Tree).

construct_helper([Head|Rest], Acc, Tree) :-
    add_tree(Head, Acc, AddTree),
    construct_helper(Rest, AddTree, Tree).
construct_helper([], Acc, Acc).

%% size_tree(+Tree, Size)
%  Calculates the number of elements in the given binary search tree.
size_tree(node(_, Left, Right), Size) :-
    size_tree(Left, SumLeft),
    size_tree(Right, SumRight),
    Size is 1 + SumLeft + SumRight.
size_tree(nil, 0).

%% min_tree(+Tree, Min)
%  Determines the minimum element of the given binary search tree.
min_tree(node(Root, Left, _), Min) :-
    minHelper(Left, Root, Min).

minHelper(node(Root, Left, _), Acc, Min) :-
    Root =< Acc,
    minHelper(Left, Root, Min).
minHelper(nil, Acc, Acc).

%% depth_tree(+Tree, Depth)
%  Calculates the number of levels in the given binary search tree.
depth_tree(nil, 0).
depth_tree((_, nil, nil), 1).
depth_tree(node(_, Left, Right), Depth) :-
    depth_tree(Left, DepthLeft),
    depth_tree(Right, DepthRight),
    Depth is max(DepthLeft, DepthRight) + 1.

%% write_tree(+Tree)
%  Displays the elements of the given tree.
write_tree(node(Root, Left, Right)) :-
    write_tree(Left),
    write(Root), write(" "),
    write_tree(Right).

write_tree(nil).

%% start
%  Serves as an entry point for the program.
start :-
    Tree = nil,
    add_tree(30, Tree, Tree1),
    add_tree(40, Tree1, Tree2),
    add_tree(10, Tree2, Tree3),
    add_tree(50, Tree3, Tree4),
    add_tree(20, Tree4, Tree5),
    List = [50,60,70,80],

    write('This is the tree: '), write_tree(Tree5), nl,
    write('This is the tree, internally: '), write(Tree5), nl,

    sum_tree(Tree5, Sum),
    write('The sum of the elements is '), write(Sum), nl,
    
    size_tree(Tree5, Size),
    write('The size of the tree is '), write(Size), nl,
    
    min_tree(Tree5, Min),
    write('The minimum element of the tree is '), write(Min), nl,
    
    depth_tree(Tree5, Depth),
    write('The depth of the tree is '), write(Depth), nl,

    write('Does the tree contain 20? '),
    (
        member_tree(20, Tree5),
        write('Yes.\n')
        ;
        write('No.\n')
    ), nl,
    
    write('This is a list: '), write(List), nl,
    construct_tree([50,60,70,80], Tree6),
    write('This is the corresponding tree, internally: '), write(Tree6), nl,
    
    size_tree(Tree6, Size2),
    write('The size of the tree is '), write(Size2), nl,

    min_tree(Tree6, Min2),
    write('The minimum element of the tree is '), write(Min2), nl,
    
    depth_tree(Tree6, Depth2),
    write('The depth of the tree is '), write(Depth2), nl.
    
    
    
    

