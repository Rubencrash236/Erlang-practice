-module(mph_drop).
-export([mph_drop/0]).

mph_drop() ->
	%Trapping a failure, reporting an error, and exiting
	process_flag(trap_exit, true),
	Drop=spawn_link(drop_w_pid,drop,[]),
	convert(Drop).
convert(Drop) -> 
	receive
		%On data send {Planemo, Distance} trigger
		{Planemo, Distance} ->
			%Send the data to drop_w_pid
			%While also sending this pid
			Drop ! {self(), Planemo, Distance},
			%Recursive call to trigger next block
			convert(Drop);
		%Pattern matching an error to log
		%{'EXIT', Pid, Reason}->
			%io:format("FAILURE: ~p died because of ~p.~n", [Pid, Reason]);
		{'EXIT', _Pid, _Reason} ->
			%Managing error instantiating a new drop process
			NewDrop=spawn_link(drop_w_pid, drop, []),
			convert(NewDrop);
		%After all this is called
		%drop_w_pid returns {Planemo, Distance, Velocity}
		{Planemo, Distance, Velocity} ->
			MphVelocity = 2.23693629*Velocity,
			io:format("On ~p, a fall of ~p meters yields a velocity of ~p mph.~n",
				 [Planemo, Distance, MphVelocity]),
			%Recursive call
			convert(Drop)
	end.
