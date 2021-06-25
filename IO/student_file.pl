/*
 * student_file_io.pl
 * By Antonio F. Huertas
 * This program reads from a file the data of a group of students
 * and writes into another file their data and averages.
 */

:- initialization(main).

%% list_average(+List, ?Average)
%  Computes the average of the given list of integers.
list_average(List, Average) :-
    sumlist(List, Sum),
    length(List, Length),
    Average is Sum / Length.
    
%% process_file(+StudentFile, +AverageFile)
%  Processes the student file by reading each student structure,
%  computing its average and writing this result to the average file.
process_file(StudentFile, AverageFile) :-
    \+ at_end_of_stream(StudentFile),
    read(StudentFile, student(Id, Name, Scores)),
    list_average(Scores, Average),
    format(AverageFile, 'student(~a, ~a, ~3f)~n', [Id, Name, Average]),
    process_file(StudentFile, AverageFile).

process_file(StudentFile, _) :-
    at_end_of_stream(StudentFile).

%% main
%  Serves as an entry point for the program.
main :-
    catch(
        open('students.txt', read, StudentFile),
        IOException,
        (
            print_message(error, IOException),
            fail
        )
    ),
    open('averages.txt', write, AverageFile),

    process_file(StudentFile, AverageFile),

    close(StudentFile),
    close(AverageFile),
    write('Files have been processed.\n').

