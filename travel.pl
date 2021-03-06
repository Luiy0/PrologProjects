/*
* travel.pl
* By Antonio F. Huertas and Luis A. Flores (841102500)
* 12/15/2015
* This is a knowledge base of fictitious travel information.
*/

% byCar(?Origin, ?Destination)
% True if Destination is reachable from Origin by car.
byCar(bayamon, guaynabo).
byCar(guaynabo, san_juan).
byCar(san_juan, carolina).
byCar(aguadilla, mayaguez).
byCar(mayaguez, san_german).

% byTrain(?Origin, ?Destination)
% True if Destination is reachable from Origin by train.
byTrain(bayamon, aguadilla).
byTrain(aguadilla, cabo_rojo).
byTrain(san_german, ponce).
byTrain(carolina, fajardo).
byTrain(carolina, ponce).

% byPlane(?Origin, ?Destination)
% True if Destination is reachable from Origin by plane.
byPlane(carolina, orlando).
byPlane(carolina, new_york).
byPlane(carolina, paris).
byPlane(paris, tokio).
byPlane(new_york, san_antonio).
byPlane(san_antonio, san_francisco).

% travelByCar(?Origin, ?Destination)
travelByCar(Origin, Destination) :- byCar(Origin, Next), travelByCar(Next, Destination).
travelByCar(Origin, Destination) :- byCar(Origin, Destination).

% travelByTrain(?Origin, ?Destination)
travelByTrain(Origin, Destination) :- byTrain(Origin, Next), travelByTrain(Next, Destination).
travelByTrain(Origin, Destination) :- byTrain(Origin, Destination).

% travelByPlane(?Origin, ?Destination)
travelByPlane(Origin, Destination) :- byPlane(Origin, Next), travelByPlane(Next, Destination).
travelByPlane(Origin, Destination) :- byPlane(Origin, Destination).

% travel(?Origin, ?Destination)
% Determines whether it is possible to travel from one place to another
travel(Origin, Destination) :- step(Origin,Place), travel(Place, Destination).
travel(Origin, Destination) :- step(Origin,Destination).

step(Origin,Destination) :- byCar(Origin,Destination).
step(Origin,Destination) :- byTrain(Origin,Destination).
step(Origin,Destination) :- byPlane(Origin,Destination).
