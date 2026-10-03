
% Male
male(abraham).
male(clancy).
male(homer).
male(bart).

% Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% Rules

father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

son(X, Y) :- parent(Y, X), male(X).

daughter(X, Y) :- parent(Y, X), female(X).

brother(X, Y) :- male(X), X \= Y, setof(P, (parent(P, X), parent(P, Y)), _).

sister(X, Y) :- female(X), X \= Y, setof(P, (parent(P, X), parent(P, Y)), _).

grandfather(X, Y) :- male(X), parent(X, P), parent(P, Y).

aunt(X, Y) :- sister(X, P), parent(P, Y).

uncle(X, Y) :- brother(X, P), parent(P, Y).

cousin(X, Y) :- parent(P1, X), parent(P2, Y), X \= Y, (brother(P1, P2) ; sister(P1, P2)).

ancestor(X, Y) :- parent(X, Y).

ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).