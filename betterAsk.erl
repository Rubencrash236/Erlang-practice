-module(betterAsk).
-export([term/0]).

term() -> 
	Input = io:read("What {planemo, distance}? >>"),
	process_term(Input).
% Makes a loop with the term function
% Keeps asking for new Term after yielding the answer
process_term({ok, Term}) when is_tuple(Term) -> 
	Velocity = dropTuple:fall_velocity(Term),
	io:format("Yield~w.~n", [Velocity]),
	term();
% Quits the loop if {ok, quit}
process_term({ok, quit}) ->
	io:format("Goodbye.~n");
%If argument is not a tuple
%return the warning and ask again
process_term({ok, _}) ->
	io:format("You must enter a tuple.~n"),
	term();
%if the syntax is not the correct
process_term({error, _}) ->
	io:format("You must enter a tuple with correct syntax.~n"),
	term().
