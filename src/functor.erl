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

-module(functor).

-export_type([functor/0, functorial/2]).

-export(['<$'/3]).

-import(base, [const/1]).

-type functor()           :: module() | {module(), functor()}.
-type functorial(_F,  _A) :: any().


%% Functor primitives
-callback fmap(Fun, FA) -> FB when
      Fun :: fun((A) -> B),
      FA  :: functorial(F, A),
      FB  :: functorial(F, B),
      F   :: functor().
-callback '<$'(A, FB) -> FA when
      F  :: functor(),
      FB :: functorial(F, B),
      B  :: any(),
      FA :: functorial(F, A).


-spec '<$'(F, A, FB) -> FA when
      F  :: functor(),
      FB :: functorial(F, B),
      B  :: any(),
      FA :: functorial(F, A).
'<$'(Functor, A, FB) -> Functor:fmap(const(A), FB).
