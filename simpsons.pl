%--- FACTS ---
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).


% --- RULES ---
father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

son(S, P) :- parent(P, S), male(S).
daughter(D, P) :- parent(P, D), female(D).

brother(B, X) :- parent(P, B), parent(P, X), male(B), B \== X.
sister(S, X) :- parent(P, S), parent(P, X), female(S), S \== X.

grandfather(GF, C) :- parent(GF, P), parent(P, C), male(GF).
grandmother(GM, C) :- parent(GM, P), parent(P, C), female(GM).

uncle(U, X) :- parent(P, X), brother(U, P).
aunt(A, X) :- parent(P, X), sister(A, P).

cousin(C1, C2) :- parent(P1, C1), parent(P2, C2), (brother(P1, P2) ; sister(P1, P2)).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).




