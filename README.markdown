ActiveRecord Sybase Adapter
==========================

Flawed though it is, my office still depends on this for our app.
At some point, we may be able to retire this completely, but for now, we need a (reliable) source for this in our Gemfile.

Installing 'sybsql'
------------------

Install **freetds** library stable version.

Download **sybase-ctlib** from [https://github.com/ifad/sybct-ruby](https://github.com/ifad/sybct-ruby).

Edit **extconf.rb** if you're not on Linux or your ASE is not in `/opt/sybase`
and adjust `$CFLAGS` and `$LDFLAGS` as appropriate.

Compile:

    $ ruby extconf.rb
    $ make

And finally move the generated files manually because the **make install** command doesn't work.

    $ cp sybct.rb sybsql.rb `ruby -e "print RbConfig::CONFIG['sitelibdir']"`
