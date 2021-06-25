/*
 * student_eval.pl
 * By Antonio F. Huertas
 * This program computes the average for a course taken by some students.
 */

%% list_average(+List, ?Average)
%  Computes the average of the given list of integers.
list_average(List, Average) :-
    sumlist(List, Sum),
    length(List, Length),
    Average is Sum / Length.

%% write_data(+Student)
%  Displays the data of a given student.
write_data(student(Id, Name, Exams)) :-
    write('\tThe id is '), write(Id), nl,
    write('\tThe name is '), write(Name), nl,
    write('\tThe exam scores are '), write(Exams), nl,
    
    list_average(Exams, Average),
    write('\tThe course average is '), write(Average), nl.

%% start
%  Serves as an entry-point for the program.
start :-
    Student1 = student('111', 'John Doe', [90,94,86]),
    write('This is the first student:\n'),
    write_data(Student1), nl,

    Student2 = student('222', 'Jane Doe', [80,95,73]),
    write('\nThis is the second student:\n'),
    write_data(Student2), nl.

