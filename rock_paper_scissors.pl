/*
* rock_paper_scissors.pl
*/

menu('y', Wins, Games):-
	write('Enter your selection (0= Rock, 1=Paper, 2=Scissors)\n'),
	read(YourSelection), nl,
	MySelection is random(3),
	process(YourSelection, MySelection, Wins, Games).

menu('n', Wins, Games):-
	Average is Wins / Games,
	write('Thanks for playing, You won '),
	write(Average),
	write('% of Games.').

menu(_, Wins, Games):-
	write('Please enter (y/n).'),
	read(Selection), nl,
	menu(Selection, Wins, Games).

process(0, 1, Wins, Games):-
	write('My Selection was 1=Paper. You Lost!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewGames is Games + 1,
	menu(Selection, Wins, NewGames).


process(0, 2, Wins, Games):-
	write('My Selection was 2=Scissors. You Win!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewWins is Wins + 1,
	NewGames is Games + 1,
	menu(Selection, NewWins, NewGames).


process(1, 0, Wins, Games):-
	write('My Selection was 0=Rock. You Win!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewWins is Wins + 1,
	NewGames is Games + 1,
	menu(Selection, NewWins, NewGames).


process(1, 2, Wins, Games):-
	write('My Selection was 2=Scissors. You Lost!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewGames is Games + 1,
	menu(Selection, Wins, NewGames).


process(2, 0, Wins, Games):-
	write('My Selection was 0=Rock. You Lost!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewGames is Games + 1,
	menu(Selection, Wins, NewGames).


process(2, 1, Wins, Games):-
	write('My Selection was 1=Paper. You Win!.\n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	NewWins is Wins + 1,
	NewGames is Games + 1,
	menu(Selection, NewWins, NewGames).


process(0, 0, Wins, Games):-
	write('My Selections was 0=Rock. Tied Game. \n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	menu(Selection, Wins, Games).
process(1, 1, Wins, Games):-
	write('My Selections was 1=Paper. Tied Game. \n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	menu(Selection, Wins, Games).
process(2, 2, Wins, Games):-
	write('My Selections was 2=Scissors. Tied Game. \n'),
	write('Do you want to play again\n'),
        read(Selection), nl,
	menu(Selection, Wins, Games).

process(_, _, Wins, Games):-
	write('Wrong Answer! \n'),
	menu(_, Wins, Games).

main:-
	menu(_, 0, 0).



