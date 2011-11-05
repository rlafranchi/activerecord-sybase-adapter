# Changelog

## 3.0-stable

* 01 Mar 2006: Initial version. Based on code from Will Sobel
               (http://dev.rubyonrails.org/ticket/2030)

* 17 Mar 2006: Added support for migrations; fixed issues with `:boolean` columns.

* 13 Apr 2006: Improved column type support to properly handle dates and user-defined types
               Fixed quoting of integer columns.

* 05 Jan 2007: Updated for Rails 1.2 release:
               Restricted Fixtures#insert_fixtures monkeypatch to Sybase adapter;
               Removed SQL type precision from TEXT type to fix broken
               ActiveRecordStore (jburks, #6878); refactored `select` to use `execute`
               Fixed leaked exception for no-op `change_column`
               Removed verbose SQL dump from `columns`
               Added missing scale parameter in normalize_type().

* 25 Jan 2011: Cleaned up, updated for AREL, added support for splitting query batches
               when a DECLARE CURSOR is detected

* 15 Feb 2011: More clean ups, implemented `.primary_key` so that `.save` works from AR

* 21 Feb 2011: Clean up as usual, implemented `.insert_sql` so that `.save` correctly
               sets the new record ID in the AR instance; Implemented `reconnect!`

* 03 Nov 2011: Made migrations work again by implementing `select_rows` and
               removing `sp_help` usage to get data type storage information
