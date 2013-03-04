ActiveRecord Sybase Adapter
==========================

Flawed though it is, my office still depends on this for our app.
At some point, we may be able to retire this completely, but for now, we need a (reliable) source for this in our Gemfile.

Installing 'sybsql'
------------------

Install **freetds** library stable version.

Download **sybase-ctlib** from [http://raa.ruby-lang.org/project/sybase-ctlib/](http://raa.ruby-lang.org/project/sybase-ctlib/) and uncompress it.

Edit **extconf.rb** file and make at least this changes:

    $ $CFLAGS = "-g -Wall -DFREETDS -I#{sybase}/include"
    $ $LDFLAGS = " -L#{sybase}/lib -L/freetds-0.91/src/tds/.libs" 
    $ $LOCAL_LIBS = "-lct  -lsybdb -rdynamic -ldl -lnsl -lm"

Time to compile

    $ ruby extconf.rb
    $ make

And finally move the generated files manually because the **make install** command doesn't work.

    $ cp sybct.rb sybct.so sybsql.rb ~/.rbenv/versions/1.8.7-p352/lib/ruby/site_ruby/1.8/i686-linux