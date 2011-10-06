-module(znodeapi_test).

-include_lib("eunit/include/eunit.hrl").

%----------------------------------------------------------
% unit tests
%----------------------------------------------------------
  
setup() ->
    application:set_env(gproc, gproc_dist, all),
    application:start(sasl),
    application:start(gproc),
    application:start(catherder),
    ok.
  
create_test_() ->
    {setup, fun setup/0, 
     ?_test(
	begin
	    ok = znodeapi:create("/foo", 1),
	    ok = znodeapi:create("/foo/bar", 1),
	    {error, bad_arguments, _} = znodeapi:create("/bar/foo", 1)
	end)
    }.
   
    
	