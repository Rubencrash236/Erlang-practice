-module(betterDrop).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
	Gravity = case Planemo of
			  earth -> 9.8;
			  moon -> 1.6;
			  mars -> 3.71
		  end, %Use comma when the function is not done
	math:sqrt(2*Gravity*Distance).
