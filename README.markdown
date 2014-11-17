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
    $ make install

And finally install the ruby libraries into the site\_ruby directory, as make
install doesn't do it. For ruby 1.9 and above:

    $ cp sybct.rb sybsql.rb `ruby -e "require 'rbconfig'; print RbConfig::CONFIG['sitelibdir']"`
