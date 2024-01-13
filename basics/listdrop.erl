-module(listdrop).
-export([falls/1]).

falls(List) -> falls(List,[]).

falls([], Results) -> lists:reverse(Results);
%For each Head run the dropTuple fallvelocity/1 -> {Planemo, Distance}
% then append the results
falls([Head|Tail], Results) -> falls(Tail, [dropTuple:fall_velocity(Head)|Results]).
