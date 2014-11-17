ActiveRecord Sybase Adapter
===========================

This adapter is an almost complete rewrite of the original Sybase
adapter by John R. Sheets, brought up to date with Rails 3.1.

It depends on a [sybase Visitor for AREL](http://github.com/ifad/arel-sybase-visitor)
that implements LIMIT and OFFSET using Cursors on ASE 15 and temp
tables on ASE 12.5. Because of this difference, the adapter does
*NOT* depend explicitly on the visitor, but rather you must use
Bundler to require the branch you need in your Gemfile.

Caveats
-------

We are not releasing this adapter on rubygems.org in order to not
disrupt live rails application depending on the age old adapter
still available on gems.rubyonrails.org.

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

    $ cp sybct.rb sybsql.rb `ruby -e "print RbConfig::CONFIG['sitelibdir']"`

Credits
-------

Brought up to date with Rails 3.0 by by Marcello Barnaba <vjt@openssl.it>,
and Rails 3.1 thanks to Simone Carletti <weppos@weppos.net>.
