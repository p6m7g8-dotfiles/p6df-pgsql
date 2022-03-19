
######################################################################
#<
#
# Function: p6df::modules::pgsql::deps()
#
#>
######################################################################
p6df::modules::pgsql::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::external::brew()
#
#>
######################################################################
p6df::modules::pgsql::external::brew() {

  brew install postgresql

  brew install pg_top
  brew install pgbadger
  brew install pgbouncer
  brew install pgcli
  brew install pgformatter
  brew install pgpdump
  brew install pgrouting
  brew install pgtoolkit
  brew install pgtune

  brew install check_postgres
  brew install postgis

  brew install --cask pgadmin4
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::home::symlink()
#
#>
######################################################################
p6df::modules::pgsql::home::symlink() {

  ln -sf $P6_DFZ_SRC_P6M7G8_DIR/p6df-db/share/pgsqlrc $P6_DFZ_DATA_DIR/.pgsqlrc
}

######################################################################
#<
#
# Function: p6df::modules::pgsql::init()
#
#>
######################################################################
p6df::modules::pgsql::init() {

}

# To migrate existing data from a previous major version of PostgreSQL run:
#   brew postgresql-upgrade-database
#
# This formula has created a default database cluster with:
#   initdb --locale=C -E UTF-8 /usr/local/var/postgres
# For more details, read:
#   https://www.postgresql.org/docs/12/app-initdb.html
#
# To have launchd start postgresql now and restart at login:
#   brew services start postgresql
# Or, if you don't want/need a background service you can just run:
#   pg_ctl -D /usr/local/var/postgres start

# The config file: /usr/local/etc/pgbouncer.ini is in the "ini" format and you
# will need to edit it for your particular setup. See:
# https://pgbouncer.github.io/config.html

# The auth_file option should point to the /usr/local/etc/userlist.txt file which
# can be populated by the /usr/local/opt/pgbouncer/bin/mkauth.py script.

# To have launchd start pgbouncer now and restart at login:
#   brew services start pgbouncer
# Or, if you don't want/need a background service you can just run:
#   pgbouncer -q /usr/local/etc/pgbouncer.ini

# You must configure your PostgreSQL server before using pgBadger.
# Edit postgresql.conf (in /usr/local/var/postgres if you use Homebrew's
# PostgreSQL), set the following parameters, and restart PostgreSQL:

#  log_destination = 'stderr'
#  log_line_prefix = '%t [%p]: [%l-1] user=%u,db=%d '
#  log_statement = 'none'
#  log_duration = off
#  log_min_duration_statement = 0
#  log_checkpoints = on
#  log_connections = on
#  log_disconnections = on
#  log_lock_waits = on
#  log_temp_files = 0
#  lc_messages = 'C'