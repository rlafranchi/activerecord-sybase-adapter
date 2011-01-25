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

This way, if you call .to_sql onto AREL nodes you'll get the whole
SQL string back, but you won't trigger cursor leakage.

  - vjt  Tue Jan 25 15:18:27 CET 2011

