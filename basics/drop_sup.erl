-module(drop_sup).
-behaviour(supervisor).
-export([start_link/0]). %Convenience call for startup
-export([init/1]). %Supervisors calls
-define(SERVER, ?MODULE).

%%% convenience method for startup
start_link() -> 
	supervisor:start_link({local, ?SERVER}, ?MODULE,[]).

%%% supervisor callback
init([]) ->
	SupFlags = #{strategy => one_for_one,
		    intensity => 1,
		    period => 5},
	
	Drop = #{id => 'drop_otp',
		start =>{'drop_otp', start_link, []},
		restart => permanent,
		shutdown => 5000,
		type => worker,
		modules => ['drop_otp']},

	{ok, {SupFlags, [Drop]}}.
