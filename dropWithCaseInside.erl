-module(dropWithCaseInside).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
	Gravity = case Planemo of
			  earth when Distance >= 0 -> 9.8;
			  moon when Distance >= 0 -> 1.6;
			  mars when Distance >= 0 -> 3.71
		  end,
	math:sqrt(2*Gravity*Distance).

