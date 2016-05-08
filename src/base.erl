%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License
%% at http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and
%% limitations under the License.
%%
%% Copyright (c) 2016 Eric Bailey.  All rights reserved.
%%

-module(base).

-export([const/1]).

-spec const(A) -> fun((_) -> A) when A :: any().
const(X) -> fun (_) -> X end.
