zebra_owner(O) :-
	houses(H),
	member(house(O,zebra,_,_,_), H).

water_drinker(D) :-
	houses(H),
	member(house(D,_,_,water,_), H).

houses(H) :-
    % There are 5 houses 
	length(H, 5),
	% The Englishman lives in the red house.
    member(house(englishman,_,_,_,red), H),
    % The Spaniard owns the dog.
    member(house(spaniard,dog,_,_,_), H),
	% Coffee is drunk in the green house.
    member(house(_,_,_,coffee,green), H),
	% The Ukrainian drinks tea
    member(house(ukrainian,_,_,tea,_), H),
	% The green house is immediately to the right of the ivory house.
    next(house(_,_,_,_,ivory),house(_,_,_,_,green), H),
    % The Old Gold smoker owns snails.
	member(house(_,snails,gold,_,_), H),
    % Kools are smoked in the yellow house.
	member(house(_,_,kools,_,yellow), H),
    % Milk is drunk in the middle house.
    H = [_,_,house(_,_,_,milk,_),_,_],
	% The Norwegian lives in the first house.
    H = [house(norwegian,_,_,_,_)|_],
    % The man who smokes Chesterfields lives in the house next to the man with the fox.
	next(house(_,fox,_,_,_), house(_,_,chesterfield,_,_), H),
    % Kools are smoked in the house next to the house where the horse is kept.
	next(house(_,_,kools,_,_), house(_,horse,_,_,_), H),
    % The Lucky Strike smoker drinks orange juice.
	member(house(_,_,lucky,juice,_), H),
    % The Japanese smokes Parliaments.
	member(house(japanese,_,parliaments,_,_), H),
	% The norwegian lives next to the blue house
    next(house(norwegian,_,_,_,_), house(_,_,_,_,blue), H).
	% member(house(_,_,_,water,_), Houses),		% one of them drinks water
	% member(house(_,zebra,_,_,_), Houses).		% one of them owns a zebra
 
% Houses A and B are next to each other if A is next to B
next(A, B, L) :-
    append(_, [A,B|_], L).

% % Or if B is next to A
next(A, B, L) :-
    append(_, [B,A|_], L).

%?-zebra_owner(Owner).

%?- water_drinker(Drinker).

%?-houses(H).
