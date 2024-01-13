{application, drop,
[{description, "Dropping objects from towers"},
{vsn,"0.0.1"},
{modules, [drop_otp,drop_sup,drop_app]},
{registered,[drop_otp,drop_sup]},
{applications, [kernel,stdlib]},
{mod, {drop_app,[]}}]}.
