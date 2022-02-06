-module(reqopt_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, reqopt).
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 reqopt -x str"}, % How to use the plugin
	    % list of options understood by the plugin
            {opts, [xreq, $x, "xreq", undefined, "required optional parameter"]},
            {short_desc, "required optionals"},
            {desc, "required optionals"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
	get_reqx(State),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).


get_reqx(State) ->
	{Args, _} = rebar_state:command_parsed_args(State),
	case proplists:get_value(xreq, Args) of
		undefined -> format_error("xreq not sepcified!");
	        _ -> ok
        end.
