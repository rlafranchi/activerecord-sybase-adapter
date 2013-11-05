ActiveRecord Sybase Adapter (TDS branch)
========================================

This adapter is an almost complete rewrite of the original Sybase
adapter by John R. Sheets, brought up to date with Rails 2.0 and
with the database driver changed from the original Sybase CT with
[Tiny TDS](http://rubydoc.info/gems/tiny_tds/frames).

Caveats
-------

We are not releasing this adapter on rubygems.org in order to not
disrupt live rails application depending on the age old adapter
still available on gems.rubyonrails.org.

Credits
-------

Tiny TDS support was initiated by Darrin Thompson <darrinth@gmail.com>
and completed by Marcello Barnaba <vjt@openssl.it>. Code reordering and
clean up thanks to Simone Carletti <weppos@weppos.net>.
