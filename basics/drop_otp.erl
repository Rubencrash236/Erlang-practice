-module(drop_otp).
-behaviour(gen_server).
-export([start_link/0]). %Convenience call for startup
-export([init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3]). % gen_Server callbacks
-define(SERVER, ?MODULE). % Macro that just defines this module as server
-record(state, {count}). % simple counter state

%%% convenience method callbacks
start_link() ->
	gen_server:start_link({local, ?SERVER}, ?MODULE, [],[]).
%%% gen_server callbacks
init([]) ->
	{ok, #state{count=0}}.
handle_call(_Request, _From, State) ->
	Distance = _Request,
	Reply = {ok, fall_velocity(Distance)},
	NewState=#state{count = State#state.count+1},
	{reply, Reply, NewState}.
handle_cast(_Msg, State) ->
	io:format("So far, calculated ~w velocities.~n", [State#state.count]),
	{noreply, State}.
handle_info(_Info, State) ->
	{noreply, State}.
terminate(_Reason, State)->
	ok.
code_change(_OldVsn, State, _Extra)->
	{ok, State}.

%%% Internal Function
fall_velocity(Distance) -> math:sqrt(2*9.1*Distance).

