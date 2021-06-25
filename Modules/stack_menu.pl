/*
 * stack_menu.pl
 * By Antonio F. Huertas
 * This program manages a menu of common stack operations.
 */

:-use_module(stack_lst).
:-initialization(main).

%% main
%  Serves as an entry point of the program.
%  Creates an empty stack and manages the menu.
main :-
    empty_stack(Stack),
    menu(Stack).

%% menu(+Stack)
%  Displays the menu, reads the selection and process this selection.
menu(Stack) :-
    write('\n\tStack Menu\n\n'),
    write('1. Push an element\n'),
    write('2. Pop an element\n'),
    write('3. View the contents\n'),
    write('4. Quit\n'),
    write('Enter your selection (1-4, ending with a full stop): '),
    read(Selection), nl,
    selection(Selection, Stack).

%% selection(+Selection, +Stack)
%  Processes the menu selection with the current stack.
selection(1, Stack) :-
    write('Enter an element (end with full stop): '),
    read(Elem),
    push(Stack, Elem, NewStack),
    write(Elem), write(' has been pushed into the stack.\n'),
    menu(NewStack).

selection(2, Stack) :-
    catch(
        (
            pop(Stack, Elem, NewStack),
            write(Elem), write(' has been popped from the stack.\n')
        ),
        empty_exception(Message),
        (
            write('Cannot pop: '), write(Message), nl,
            NewStack = Stack
        )
    ),
    menu(NewStack).

selection(3, Stack) :-
    empty_stack(Stack),
    write('Cannot show: stack is empty.\n'),
    menu(Stack).

selection(3, Stack) :-
    \+ empty_stack(Stack),
    write('These are the contents of the stack: '),
    iterate_stack(Stack, write_element), nl,
    menu(Stack).

selection(4, _) :-
    write('Thanks for using this program.\n').

selection(Selection, Stack) :-
    (
        Selection < 1
        ;
        Selection > 4
    ),
    write('Error! Selection must be between 1 and 4.\n'),
    menu(Stack).

%% write_element(+Elem)
%  Displays an element followed by a space.
write_element(Elem) :-
    write(Elem), write(' ').
