reqopt
=====

required optionals

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        {reqopt, {git, "https://host/user/reqopt.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 reqopt
    ===> Fetching reqopt
    ===> Compiling reqopt
    <Plugin Output>
