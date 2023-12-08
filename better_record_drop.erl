-module(record_drop).
-export([fall_velocity/1]).
-include("records.hrl").

%Pattern matching whole record
%Pattern matching the components of the record
fall_velocity(#tower{planemo=Planemo, height=Distance} = T) ->
io:format("From ~s's elevation of ~p meters on ~p, the object will reach ~p m/s
before crashing in ~s.~n",[T#tower.name, Distance, Planemo,
			  %Pattern matching of components 
			   fall_velocity(Planemo,Distance), T#tower.location ]).

fall_velocity(earth, Distance) when Distance >= 0 -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance).
