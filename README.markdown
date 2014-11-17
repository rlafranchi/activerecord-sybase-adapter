ActiveRecord Sybase Adapter
===========================

Flawed though it is, we still depends on this for our app. Because
stinky code makes app stink as well, this adapter has been cleaned
up for Rails 3, by removing all the LIMIT and OFFSET hacks, that
are now handled into AREL.

A sybase Visitor for AREL [is available on the IFAD public GitHub
account](http://github.com/ifad/arel-sybase-visitor) as well, with
excellent pagination support using Server-Side Cursors (DBAs please
scream away from here! :-D).

Because cursors must be declared in their own batch, this adapter
splits SQL that contains a DECLARE cursor into two separate batches.

This way, if you call .to\_sql onto AREL nodes you'll get the whole
SQL string back, but you won't trigger cursor leakage.

  - vjt  Tue Jan 25 15:18:27 CET 2011

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

    $ cp sybct.rb sybsql.rb `ruby -rrbconfig -e "print RbConfig::CONFIG['sitelibdir']"`
