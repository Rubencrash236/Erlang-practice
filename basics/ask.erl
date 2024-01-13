-module(ask).
-export([term/0, chars/0, line/0]).

term() ->
	Input = io:read("What {planemo, distance}? >>"),
	process_term(Input).

process_term({ok, Term}) when is_tuple(Term) -> dropTuple:fall_velocity(Term);

process_term({ok, _}) -> io:format("You must enter a tuple.~n");

process_term({error, _}) -> io:format("You must enter a tuple with correct syntax. ~n").

%Get the first character of an input
chars() ->
	io:format("Which planemo are you on?~n"),
	io:format("1. Earth~n"),
	io:format("2. Earth's Moon~n"),
	io:format("3. Mars~n"),
	io:get_chars("Which?> ", 1).

%Collecting user responses a line at a time
line() ->
	Planemo = get_planemo(),
	Distance = get_distance(),
	dropTuple:fall_velocity({Planemo, Distance}).

get_planemo() ->
	io:format("Where are you?~n"),
	io:format("1. Earth~n"),
	io:format("2. Earth's Moon~n"),
	io:format("3. Mars~n"),
	Answer = io:get_line("Which?>"),

	Value = hd(Answer),
	char_to_planemo(Value).

char_to_planemo(Char) -> 
	if
		[Char]== "1"->earth;
		Char== $2 -> moon;
		Char== 51 -> mars
	end.
get_distance() ->
	Input = io:get_line("How far? (meters) >"),
	Value = string:strip(Input, right, $\N),
	{Distance, _} = string:to_integer(Value),
	Distance.
